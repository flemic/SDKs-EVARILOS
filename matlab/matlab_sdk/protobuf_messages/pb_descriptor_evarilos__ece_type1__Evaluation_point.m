function [descriptor] = pb_descriptor_evarilos__ece_type1__Evaluation_point()
%pb_descriptor_evarilos__ece_type1__Evaluation_point Returns the descriptor for message Evaluation_point.
%   function [descriptor] = pb_descriptor_evarilos__ece_type1__Evaluation_point()
%
%   See also pb_read_evarilos__ece_type1__Evaluation_point
  
  descriptor = struct( ...
    'name', 'Evaluation_point', ...
    'full_name', 'evarilos.ece_type1.Evaluation_point', ...
    'filename', 'message_evarilos_central_engine_type1.proto', ...
    'containing_type', 'evarilos.ece_type1', ...
    'fields', [ ...
      struct( ...
        'name', 'point_id', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.point_id', ...
        'index', 1, ...
        'number', uint32(1), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(2), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'localized_node_id', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.localized_node_id', ...
        'index', 2, ...
        'number', uint32(2), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'true_coordinate_x', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.true_coordinate_x', ...
        'index', 3, ...
        'number', uint32(3), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(2), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(x, 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'true_coordinate_y', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.true_coordinate_y', ...
        'index', 4, ...
        'number', uint32(4), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(2), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(x, 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'true_coordinate_z', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.true_coordinate_z', ...
        'index', 5, ...
        'number', uint32(5), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(x, 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'true_room_label', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.true_room_label', ...
        'index', 6, ...
        'number', uint32(6), ...
        'type', uint32(9), ...
        'matlab_type', uint32(7), ...
        'wire_type', uint32(2), ...
        'label', uint32(1), ...
        'default_value', '', ...
        'read_function', @(x) char(x{1}(x{2} : x{3})), ...
        'write_function', @uint8, ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'est_coordinate_x', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.est_coordinate_x', ...
        'index', 7, ...
        'number', uint32(7), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(2), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(x, 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'est_coordinate_y', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.est_coordinate_y', ...
        'index', 8, ...
        'number', uint32(8), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(2), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(x, 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'est_coordinate_z', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.est_coordinate_z', ...
        'index', 9, ...
        'number', uint32(9), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(x, 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'est_room_label', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.est_room_label', ...
        'index', 10, ...
        'number', uint32(10), ...
        'type', uint32(9), ...
        'matlab_type', uint32(7), ...
        'wire_type', uint32(2), ...
        'label', uint32(1), ...
        'default_value', '', ...
        'read_function', @(x) char(x{1}(x{2} : x{3})), ...
        'write_function', @uint8, ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'latency', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.latency', ...
        'index', 11, ...
        'number', uint32(11), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(x, 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'power_consumption', ...
        'full_name', 'evarilos.ece_type1.Evaluation_point.power_consumption', ...
        'index', 12, ...
        'number', uint32(12), ...
        'type', uint32(1), ...
        'matlab_type', uint32(5), ...
        'wire_type', uint32(1), ...
        'label', uint32(1), ...
        'default_value', double(0), ...
        'read_function', @(x) typecast(x, 'double'), ...
        'write_function', @(x) typecast(double(x), 'uint8'), ...
        'options', struct('packed', false) ...
      ) ...
    ], ...
    'extensions', [ ... % Not Implemented
    ], ...
    'nested_types', [ ... % Not implemented
    ], ...
    'enum_types', [ ... % Not Implemented
    ], ...
    'options', [ ... % Not Implemented
    ] ...
  );
  
  descriptor.field_indeces_by_number = java.util.HashMap;
  put(descriptor.field_indeces_by_number, uint32(1), 1);
  put(descriptor.field_indeces_by_number, uint32(2), 2);
  put(descriptor.field_indeces_by_number, uint32(3), 3);
  put(descriptor.field_indeces_by_number, uint32(4), 4);
  put(descriptor.field_indeces_by_number, uint32(5), 5);
  put(descriptor.field_indeces_by_number, uint32(6), 6);
  put(descriptor.field_indeces_by_number, uint32(7), 7);
  put(descriptor.field_indeces_by_number, uint32(8), 8);
  put(descriptor.field_indeces_by_number, uint32(9), 9);
  put(descriptor.field_indeces_by_number, uint32(10), 10);
  put(descriptor.field_indeces_by_number, uint32(11), 11);
  put(descriptor.field_indeces_by_number, uint32(12), 12);
  
