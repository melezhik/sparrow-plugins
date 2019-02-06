set -x
perl6 -MAlgorithm::MinMaxHeap -e '

my $heap = Algorithm::MinMaxHeap[Int].new;
$heap.insert(0);
$heap.insert(1);
$heap.insert(2);
$heap.insert(5);
$heap.insert(4);
$heap.insert(3);
$heap.insert(6);
$heap.insert(7);
$heap.insert(8);

my @array;
@array.push($heap.pop-max) until $heap.is-empty;
@array.say;'

