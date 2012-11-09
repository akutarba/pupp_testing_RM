 $one = 1
    $one_thirty = 1.30
    $two = 2.034e-2

    $result = ((($two + 2)/$one_thirty) + 4 * 5.45) - (6 << ($two + 4)) + (0x800 + -9)

    $res = (dd(ddd(ddd(ddd(ddd(d))))))

$one = 1
$two = 2
$var = ( $one < $two ) and ( $one + 1 == $two )

if $host =~ /^www(\d+)\./ {
      notice('Welcome web server #$1')
}

$eatme = 'eat'
    if $eatme in ['ate', 'eat'] {
    }

    $value = 'beat generation'
    if 'eat' in $value {
      notice('on the road')
    }

    if ! ($eatme in ['ate', 'eat']) { ... }