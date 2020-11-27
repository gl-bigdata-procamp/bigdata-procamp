usage() {
  echo -e "Usage: $0 [-i <path>] [-o <path>]\n"\
       "where\n"\
       "-i defines an input path\n"\
       "-o defines an output path\n"\
       "-e defines an executor: hadoop or yarn, yarn but default\n"\
       "\n"\
        1>&2
  exit 1
}


while getopts ":i:o:e:" opt; do
    case "$opt" in
        i)  INPUT_PATH=${OPTARG} ;;
        o)  OUTPUT_PUTH=${OPTARG} ;;
        e)  EXECUTOR=${OPTARG} ;;
        *)  usage ;;
    esac
done

if [[ -z "$INPUT_PATH" ]];
then
  INPUT_PATH="/bdpc/hadoop_mr/word_count/input"
fi

if [[ -z "$OUTPUT_PATH" ]];
then
  OUTPUT_PATH="/bdpc/hadoop_mr/word_count/output"
fi

if [[ -z "$EXECUTOR" ]];
then
  EXECUTOR="yarn"
fi

THIS_FILE=$(readlink -f "$0")
THIS_PATH=$(dirname "$THIS_FILE")
BASE_PATH=$(readlink -f "$THIS_PATH/../")
APP_PATH="$THIS_PATH/word_counter-1.0-jar-with-dependencies.jar"

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "THIS_FILE = $THIS_FILE"
echo "THIS_PATH = $THIS_PATH"
echo "BASE_PATH = $BASE_PATH"
echo "APP_PATH = $APP_PATH"
echo "-------------------------------------"
echo "INPUT_PATH = $INPUT_PATH"
echo "OUTPUT_PUTH = $OUTPUT_PATH"
echo "-------------------------------------"

mapReduceArguments=(
  "$APP_PATH"
  "com.globallogic.bdpc.mapreduce.wordcount.WordCount2"
  "$INPUT_PATH"
  "$OUTPUT_PATH"
)

SUBMIT_CMD="${EXECUTOR} jar ${mapReduceArguments[@]}"
echo "$SUBMIT_CMD"
${SUBMIT_CMD}

echo "You should find results here: 'hadoop fs -ls $OUTPUT_PATH'"
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
