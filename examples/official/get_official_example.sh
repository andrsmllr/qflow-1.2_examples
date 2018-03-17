wget http://opencircuitdesign.com/qflow/example/map9v3.v
wget http://opencircuitdesign.com/qflow/example/load.tcl
wget http://opencircuitdesign.com/qflow/example/map9v3.tcl
wget http://opencircuitdesign.com/qflow/example/map9v3.cel2
wget http://opencircuitdesign.com/qflow/example/osu035_stdcells.gds2
wget http://opencircuitdesign.com/qflow/example/map9v3_gates_tb.v
wget http://opencircuitdesign.com/qflow/example/osu035_stdcells.v
wget http://opencircuitdesign.com/qflow/example/setup.tcl
wget http://opencircuitdesign.com/qflow/example/map9v3_cosim_tb.spi
mkdir -p ./source
mkdir -p ./synthesis
mkdir -p ./layout
mv ./*.v ./source/
mv ./*.tcl ./layout/
