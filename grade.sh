CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'


if [[ -f student-submission/ListExamples.java ]]
then 
    echo "ListExamples found"
else 
    echo "ListExamples not found"
    exit 1
fi

javac ListExamples.java
javac -cp $CPATH TestListExamples.java
if [[ $? -ne 0 ]]
    then
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > testResults.txt

grep "(TestListExamples)" testResults.txt > gradeAssign.txt
numErrors=`wc -l < gradeAssign.txt`
if [[ $numErrors -ne 0 ]]
then
    echo "failed"
else
    echo "passed"
fi