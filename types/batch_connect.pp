# Defines cluster config batch_connect values
type Openondemand::Batch_connect = Struct[{
  Optional['basic']     => Struct[{'script_wrapper' => String}],
  Optional['vnc']       => Struct[{'script_wrapper' => String}],
  Optional['ssh_allow'] => Boolean,
}]
