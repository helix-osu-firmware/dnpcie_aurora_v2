# Aurora core for the HELIX master merger

This module (dnpcie_aurora_core)  implements a 32-bit Aurora 8b10b core
interfacing to a 16-bit core. This means

1. The transmit (outbound) path is a 16-bit AXI4-Stream interface. It
   embeds a 16-bit CRC at the end.
   
2. The receive (inbound) path is a 32-bit AXI4-Stream interface. It
   checks incoming packets with a 16-bit CRC.

Note: this setup has ONLY been checked transmitting/receiving frames
with even numbers of payload words. Because a 16-bit CRC is added,
this means that all frames are actually an odd number of words, but the
CRC is transparently added to outbound frames and stripped from inbound
frames, so to the user it's always even.

## Repository organization

The base Aurora 8b10b core is located in the aurora_core subdirectory,
with the GT files in gt_static. Both of those are from the generated HDL
from an Aurora 8b10b 32-bit core with no CRC.

An AXI4-Stream Infrastructure IP (dnpcie_aurora_axis_16to32.xci) is used
in the transmit path and is located under the ip subdirectory.

The additional modules needed to adapt a 16-bit transmit path and add
the necessary CRC, as well as to compute, compare, and strip the 16-bit
CRC from the outbound 32-bit data, are located in the top directory.

## Issues

1. Doesn't handle TKEEP != all ones at all yet, so don't do anything
   other than that.