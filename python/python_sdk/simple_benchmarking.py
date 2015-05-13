#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""simple_benchmarking.py: Python SDK."""

__author__ = "Filip Lemic"
__copyright__ = "Copyright 2015, EVARILOS Project"

__version__ = "1.0.0"
__maintainer__ = "Filip Lemic"
__email__ = "lemic@tkn.tu-berlin.de"
__status__ = "Development"

import raw_data_pb2
import urllib2
import time
import json
import message_evarilos_engine_type1_pb2
import experiment_results_pb2

apiURL = 'http://ebp.evarilos.eu:5000/'

def get_raw_data_from_collection(db_id, coll_id):
	
	req = RequestWithMethod(apiURL + 'evarilos/raw_data/v1.0/database/' + db_id  + '/collection/' + coll_id + '/message', 'GET', headers={"Content-Type": "application/json"}, data = 'json')
	response = urllib2.urlopen(req)
	message = json.loads(response.read())
	
	messages = {}
	for data_id in message.keys():
		req = RequestWithMethod(apiURL + 'evarilos/raw_data/v1.0/database/' + db_id  + '/collection/' + coll_id + '/message/' + data_id, 'GET', headers={"Content-Type": "application/json"}, data = 'json')
		response = urllib2.urlopen(req)
		messages[data_id] = json.loads(response.read())

	return messages

def get_raw_measurement(db_id, coll_id, data_id):

	req = RequestWithMethod(apiURL + 'evarilos/raw_data/v1.0/database/' + db_id  + '/collection/' + coll_id + '/message/' + data_id, 'GET', headers={"Content-Type": "application/json"}, data = 'json')
	response = urllib2.urlopen(req)
	message = json.loads(response.read())

	return message

def reshape_to_dictionary(data, num_meas = None, channel = None):
	if num_meas == 0 or channel == []:
		return []

	try:
		message = {}
		for i in data['raw_measurement']:
			if channel is None or i['channel'] in channel:
				if i['sender_bssid'] not in message.keys():
					message[i['sender_bssid']] = []
				if num_meas is None or i['run_nr'] <= num_meas:
					message[i['sender_bssid']].append(i['rssi'])
	except:
		return 'Wrong message format.'

	return message

def give_coordinates(data):

	message = {}
	message['true_coordinate_x'] = data['raw_measurement'][1]['receiver_location']['coordinate_x']
	message['true_coordinate_y'] = data['raw_measurement'][1]['receiver_location']['coordinate_y']
	try:
		message['true_coordinate_z'] = data['raw_measurement'][1]['receiver_location']['coordinate_z']
	except:
		continue
	try:
		message['true_room'] = data['raw_measurement'][1]['receiver_location']['room_label']
	except:
		continue

	return message

def calculate_metrics(data):

	apiURI_ECE = 'http://ebp.evarilos.eu:5002/'

	experiment = message_evarilos_engine_type1_pb2.ece_type1()

	experiment.timestamp_utc = int(round(time.time() * 1000))          
	experiment.experiment_label = 'dummy'    
	experiment.scenario.testbed_label = 'dummy' 				          
	experiment.scenario.testbed_description = 'dummy'      
	experiment.scenario.experiment_description = 'dummy'                     
	experiment.scenario.sut_description = 'dummy' 
	experiment.scenario.receiver_description = 'dummy'               
	experiment.scenario.sender_description = 'dummy'            
	experiment.scenario.interference_description = 'dummy' 
	
	experiment.store_metrics = False
	experiment.metrics_storage_URI = None
	experiment.metrics_storage_database = None
	experiment.metrics_storage_collection = None
	for key in data.keys():
		location = experiment.locations.add()
		location.point_id = int(key)
		location.localized_node_id = 0
		location.true_coordinate_x = data[key]['true_coordinate_x']
		location.true_coordinate_y = data[key]['true_coordinate_y']
		location.est_coordinate_x = data[key]['est_coordinate_x']
		location.est_coordinate_y = data[key]['est_coordinate_y']
		try:
			location.latency = data[key]['latency']
		except:
			pass
		try:
			location.true_coordinate_z = data[key]['true_coordinate_z']
			location.est_coordinate_z = data[key]['est_coordinate_z']
		except:
			pass      
		try:
			location.power_consumption = data[key]['power_consumption']
		except:
			pass  
		try:
			location.true_room_label = data[key]['true_room']
		except:
			location.true_room_label = 'no_room_given'  
		try:
			location.est_room_label = data[key]['est_room_label']
		except:
			location.est_room_label = 'no_room_estimated'     
  
	# Send your data to the ECE (EVARILOS Central Engine) service
	# Serialize your protobuffer to binary string 
	experiment_string = experiment.SerializeToString()
	
	# Send your data to over HTTP to the ECE service	
	req = RequestWithMethod(apiURI_ECE + 'evarilos/ece/v1.0/calculate_and_store_metrics', 'POST', headers={"Content-Type": "application/x-protobuf"}, data = experiment_string)
	resp = urllib2.urlopen(req)
	response = json.loads(resp.read())
	return response['primary_metrics']


# Enabling DELETE, PUT, etc.
class RequestWithMethod(urllib2.Request):
    """Workaround for using DELETE with urllib2"""
    def __init__(self, url, method, data=None, headers={}, origin_req_host=None, unverifiable=False):
        self._method = method
        urllib2.Request.__init__(self, url, data, headers, origin_req_host, unverifiable)

    def get_method(self):
        if self._method:
            return self._method
        else:
            return urllib2.Request.get_method(self) 
