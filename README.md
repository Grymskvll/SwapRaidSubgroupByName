## Installation
Extract into your "World of Warcraft/Interface/Addons" folder. If downloaded directly, rename "SwapRaidSubgroupByName-master" to "SwapRaidSubgroupByName".

## Features
* Usage is the same as API "SwapRaidSubgroup(index1, index2)", except with names instead of indices. Function name can be all-lowercase. Character name capitalization doesn't matter.
* Stores raid indices and only updates them when they change (when someone joins/leaves the raid). Good for faster fastness.

## Usage ("/run" is synonymous with "/script")
* /run SwapRaidSubgroupByName("name1", "name2")
* /run swapraidsubgroupbyname("name1", "name2")
* /run SwapByName("name1", "name2")
* /run swapbyname("name1", "name2")