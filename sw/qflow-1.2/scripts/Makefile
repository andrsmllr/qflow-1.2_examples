#
# qflow project scripts makefile
#

# Main compiler arguments
CFLAGS = -g -O2
DEFS = -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DSTDC_HEADERS=1 -DHAVE_SETENV=1 -DHAVE_PUTENV=1 -DTCLSH_PATH=\"/bin/tclsh\" -DQFLOW_MAGIC_PATH=\"/usr/local/bin/magic\" -DQFLOW_QROUTER_PATH=\"/usr/local/bin/qrouter\" -DQFLOW_GRAYWOLF_PATH=\"/usr/local/bin/graywolf\" -DQFLOW_YOSYS_PATH=\"/usr/local/bin/yosys\"
LIBS = 
LDFLAGS = 
INSTALL = /bin/install -c

VERSION = 1.1
REVISION = 45

QFLOW_LIB_DIR = /usr/local/share/qflow
QFLOW_BIN_DIR = /usr/local/bin
TCLSH_PATH = /bin/tclsh

DEFAULTPARSER = @QFLOW_DEFAULT_PARSER@

TCL_SCRIPTS = blif2cel.tcl place2def.tcl place2lef2.tcl
TCL_SCRIPTS += place2net2.tcl ypostproc.tcl ybuffer.tcl
TCL_SCRIPTS += decongest.tcl addspacers.tcl getfillcell.tcl
TCL_SCRIPTS += blifanno.tcl powerbus.tcl
SHELL_SCRIPTS = synthesize.sh placement.sh router.sh vesta.sh
SHELL_SCRIPTS += qflow.sh checkdirs.sh
SHELL_SCRIPTS += cleanup.sh display.sh createGDS.sh
MAIN_SCRIPT = qflow

SCRIPTINSTALL = ${QFLOW_LIB_DIR}/scripts
TECHINSTALL = ${QFLOW_LIB_DIR}/tech
QFLOWEXECPATH = ${QFLOW_LIB_DIR}/bin
EXECINSTALL = ${QFLOW_BIN_DIR}

all:	$(MAIN_SCRIPT).in qflow.sh
	$(MAKE) launcher

launcher:  $(MAIN_SCRIPT).in
	sed -e '/QFLOW_SCRIPT_DIR/s#QFLOW_SCRIPT_DIR#$(SCRIPTINSTALL)#' \
	$(MAIN_SCRIPT).in > $(MAIN_SCRIPT)

checkdirs.sh:  checkdirs.sh.in
	sed -e '/SUBST_TECH_DIR/s#SUBST_TECH_DIR#$(TECHINSTALL)#' \
	-e '/SUBST_SCRIPT_DIR/s#SUBST_SCRIPT_DIR#$(SCRIPTINSTALL)#' \
	-e '/SUBST_BIN_DIR/s#SUBST_BIN_DIR#$(QFLOWEXECPATH)#' \
	checkdirs.sh.in > checkdirs.sh

qflow.sh:  qflow.sh.in
	sed -e '/QFLOW_SCRIPT_DIR/s#QFLOW_SCRIPT_DIR#$(SCRIPTINSTALL)#' \
	-e '/QFLOW_DEFAULT_PARSER/s#QFLOW_DEFAULT_PARSER#$(DEFAULTPARSER)#' \
	-e '/QFLOW_REVISION/s#QFLOW_REVISION#$(REVISION)#' \
	-e '/QFLOW_VERSION/s#QFLOW_VERSION#$(VERSION)#' \
	qflow.sh.in > qflow.sh

blif2cel.tcl: blif2cel.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' blif2cel.tcl.in > $@

place2def.tcl: place2def.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' place2def.tcl.in > $@

place2lef2.tcl: place2def2.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' place2lef2.tcl.in > $@

place2net2.tcl: place2net2.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' place2net2.tcl.in > $@

ypostproc.tcl: ypostproc.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' ypostproc.tcl.in > $@

ybuffer.tcl: ybuffer.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' ybuffer.tcl.in > $@

decongest.tcl: decongest.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' decongest.tcl.in > $@

powerbus.tcl: powerbus.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' powerbus.tcl.in > $@

addspacers.tcl: addspacers.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' addspacers.tcl.in > $@

getfillcell.tcl: getfillcell.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' getfillcell.tcl.in > $@

blifanno.tcl: blifanno.tcl.in
	sed -e 's#TCLSH_PATH#$(TCLSH_PATH)#' blifanno.tcl.in > $@

install: $(TCL_SCRIPTS) $(SHELL_SCRIPTS) $(MAIN_SCRIPT)
	@echo "Installing qflow scripts"
	$(INSTALL) -d $(DESTDIR)${SCRIPTINSTALL}
	for target in $(TCL_SCRIPTS); do \
	   $(INSTALL) $$target $(DESTDIR)${SCRIPTINSTALL} ;\
	done
	for target in $(SHELL_SCRIPTS); do \
	   $(INSTALL) $$target $(DESTDIR)${SCRIPTINSTALL} ;\
	done
	@echo "Installing qflow executable"
	$(INSTALL) -d $(DESTDIR)${EXECINSTALL}
	$(INSTALL) ${MAIN_SCRIPT} $(DESTDIR)${EXECINSTALL}

clean:
	$(RM) $(MAIN_SCRIPT)
	$(RM) checkdirs.sh
	$(RM) qflow.sh
	$(RM) $(TCL_SCRIPTS)

uninstall:
	$(RM) -rf ${SCRIPTINSTALL}
	$(RM) ${EXECINSTALL}/${MAIN_SCRIPT}
