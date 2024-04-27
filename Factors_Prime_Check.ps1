# Function to print the divisors
function Print-Divisors {
    param (
        [int]$n
    )
    $Prime_Is_Here = 1,$n
    $Factors = @()
    for ($i = 1; $i -le $n; $i++) {
        if ($n % $i -eq 0) {
                if ($i -eq $n) {
                    $Factors += $i
                }
                else {
                    $Factors += $i
                }
            }
        }
    $Is_Optimus = [Collections.Generic.SortedSet[String]]::CreateSetComparer().Equals($Prime_Is_Here,$Factors)
    if ($Is_Optimus -eq "true"){
        Write-Host "$n is a prime number, it's factors are only 1 and itself"
        foreach ($numba in $Prime_Is_Here) {
            Write-Host -NoNewLine "$numba "
        }
    }
    else {
        Write-Host "$n is a composite number, it's factors are:"
        foreach ($numba in $Factors) {
            Write-Host -NoNewLine "$numba "
        }
    }
}
# Main program
$Provided_Number = Read-Host "Please enter a number to find it's divisors->"
Print-Divisors -n $Provided_Number