# Copyright (c) 2016-2018, Xilinx, Inc.
# All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set incLibc "/usr/include/x86_64-linux-gnu"

open_project process_packet
set_top process_packet
add_files app.cpp -cflags "-I../common -I../../boost -DHLS_NO_XIL_FPO_LIB -DPLATFORM_zc702 --std=gnu++11 -Wno-unknown-attributes -Wno-multichar -D__SDSCC__ -I../mqttsn_publish_qos -DMAIN -D__SDSVHLS__ -D__SDSVHLS_SYNTHESIS__ -I../mqttsn_publish_qos/zc702-sdsoc -I$incLibc -w"
add_files -tb main.cpp -cflags "-I../common -I../../boost -I../mqttsn_publish_qos -I../mqttsn_publish_qos/zc702-sdsoc -DRAW -DPLATFORM_zc702 -std=gnu++11 -Wno-unknown-attributes -Wno-multichar -DMAIN -D__SDSVHLS__ -D__SDSVHLS_SYNTHESIS__ -I$incLibc -w"
open_solution "solution"
#set_part {xc7z020clg484-1}
set_part {xc7k70tfbv676-1}
create_clock -period 5.000000 -name default
config_rtl -reset_level low
csim_design -compiler clang
csynth_design
cosim_design -trace_level all

