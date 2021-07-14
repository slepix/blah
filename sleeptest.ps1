$limit = 10000000  #count
$timelimit = 10  #seconds
$sleeplimits = 1000,500,250,125,62,31,15,7,3,2,1,0 #miliseconds

foreach($sleeplimit in $sleeplimits){ 
    $count = 0
    $timeout = new-timespan -seconds $timelimit
    $sw = [diagnostics.stopwatch]::StartNew()
        while(($count -lt $limit) -and ($sw.elapsed -lt $timeout)){ 
            $count++
            Start-sleep -Milliseconds $sleeplimit
        }
    Echo "$count loops in the period of $timelimit seconds with sleep of $sleeplimit ms between runs"
}
