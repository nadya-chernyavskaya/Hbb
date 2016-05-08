#source $VO_CMS_SW_DIR/cmsset_default.sh
# shopt -s expand_aliases is needed if you want to use the alias 'cmsenv' created by $VO_CMS_SW_DIR/cmsset_default.sh instead of the less mnemonic eval `scramv1 runtime -sh`

source $VO_CMS_SW_DIR/cmsset_default.sh
source /swshare/psit3/etc/profile.d/cms_ui_env.sh  # for bash

export MYCMSENVDIR=/mnt/t3nfs01/data01/shome/nchernya/shome/nchernya/CMSSW_7_4_10/src/
cd $MYCMSENVDIR
eval `scramv1 runtime -sh`
shopt -s expand_aliases 
cmsenv
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/dcap 

export MYBATCHDIR=/mnt/t3nfs01/data01/shome/nchernya/shome/nchernya/Hbb/skim_trees/
cd $MYBATCHDIR
root=.root

mkdir $TMPDIR/$3_single
echo run_single $1 $2 $TMPDIR/$3
./run_single $1 $2 $TMPDIR/$3
xrdfs t3se01.psi.ch mkdir -p /store/user/nchernya/Hbb/v21/skimmed/$3_single
xrdcp $TMPDIR/$3_single/skimmed_tree_$2$root root://t3se01.psi.ch//store/user/nchernya/Hbb/v21/skimmed/$3_single/

#$ -o /mnt/t3nfs01/data01/shome/nchernya/shome/nchernya/Hbb/skim_trees/batch_logs/
#$ -e /mnt/t3nfs01/data01/shome/nchernya/shome/nchernya/Hbb/skim_trees/batch_logs/
