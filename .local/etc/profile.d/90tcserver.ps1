$Env:TCS_QA="$Env:ME_CODE_DIR\gitlab.eng.vmware.com\vmware-tc-server\tcs-tc-server-qa"

function tcd { cd "${Env:TCS_QA}" }
