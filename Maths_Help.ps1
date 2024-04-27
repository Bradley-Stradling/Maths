# Help function that be called to list the availble functions

# set some colors for the help displayed commands
$Front_Color = "yellow"
$Back_Color = "black"

# Function to output some text you want the rabbit to say 
function Rabbit_Speaks {
    param (
        [string]$The_Rabbit_Says
    )
    Write-Output " (\_/)"
    Write-Output " (o.o) $The_Rabbit_Says"
    Write-Output "(`")_(`")`n"
}

function Get-Math-Help {
    Write-Host "The below is a list of available functions/commands.`n"
    Write-Host "ShowMeAllYourBase - Runs all available functions from examples"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "ShowMeAllYourBase"

    Write-Host "Factor-This - Gets factors of a number. Example below"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Factor-This 27"

    Write-Host "Get-GCD - Gets the common denominator of 2 whole numbers. Example below"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-GCD 28 42"

    Write-Host "Get-LCM - Gets the least common multiple of 2 whole numbers. Example below"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-LCM 6 7"

    Write-Host "Get-Fractions-GCD - Gets the least common multiple of 2 whole numbers. Example below for 2/3 and 4/6"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-GCD 8 9 4 6"

    Write-Host "Get-Equal-Denominators - Resizes fractions to the same denominator. Example below for 2/3 and 4/6"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Equal-Denominators 8 9 4 6"

    Write-Host "Get-Fraction-Reduction - Reduces a fraction. Example below for 22/100 "
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fraction-Reduction 22 100"

    Write-Host "Get-Fractions-Added - Adds some fractions together. Example below for 2/3 1/5"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-Reduction 2 3 1 5"

    Write-Host "Get-Fractions-Subtracted - Adds some fractions together. Example below for 2/3 1/5"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-Subtracted 2 3 1 5"

    Write-Host "Get-Fractions-Multiplied - Adds some fractions together. Example below for 2/3 1/5"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-Multiplied 2 3 1 5"

    Write-Host "Get-Fractions-Divided - Adds some fractions together. Example below for 2/3 1/5"
    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-Divided 2 3 1 5"


}

# function runs all examples of the available functions. 
function ShowMeAllYourBase {
    Rabbit_Speaks "The rabbit gives you the whole base"

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-GCD 28 42"
    Get-GCD 28 42
    Write-Host "`n"

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-LCM 6 7"
    Get-LCM 6 7
    Write-Host "`n"

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Factor-This 27"
    Factor-This 27

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-GCD 8 9 4 6"
    Get-Fractions-GCD 8 9 4 6

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Equal-Denominators 8 9 4 6"
    Get-Equal-Denominators 8 9 4 6

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fraction-Reduction 22 100"
    Get-Fraction-Reduction 22 100

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-Added 2 3 1 5"
    Get-Fractions-Added 2 3 1 5

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-Subtracted  2 3 1 5"
    Get-Fractions-Subtracted 2 3 1 5

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-Multiplied 2 3 1 5"
    Get-Fractions-Multiplied 2 3 1 5

    Write-Host -ForegroundColor $Front_Color -BackgroundColor $Back_Color "Get-Fractions-Divided 2 3 1 5"
    Get-Fractions-Divided 2 3 1 5
    
}


# Function to get Factors
function Factor-This {
    param (
        [int]$Numba
    )
    $Prime_Is_Here = 1,$Numba
    $Factors = @()
    for ($i = 1; $i -le $Numba; $i++) {
        if ($Numba % $i -eq 0) {
                if ($i -eq $Numba) {
                    $Factors += $i
                }
                else {
                    $Factors += $i
                }
            }
        }
    $Is_Optimus = [Collections.Generic.SortedSet[String]]::CreateSetComparer().Equals($Prime_Is_Here,$Factors)
    if ($Is_Optimus -eq "true"){
        Rabbit_Speaks "$Numba is a prime number, it's factors are only 1 and itself"
    }
    else {
        Rabbit_Speaks "$Numba is a composite number, it's factors are: $Factors"

    }
}

# Define a function to calculate the greatest common divisor (GCD) using the Euclidean algorithm
function Get-GCD {
    param(
        [int]$First_Numba,
        [int]$Second_Numba
    )
    
    # Continue finding the remainder until it becomes zero
    while ($Second_Numba -ne 0) {
        $temp = $Second_Numba
        # Find the Modulus of the first numba by the second numba
        $Second_Numba = $First_Numba % $Second_Numba
        $First_Numba = $temp
    }
    
    # Return the GCD
    return $First_Numba
}

# Define a function to calculate the least common multiple (LCM) using the formula LCM(a, b) = (a * b) / GCD(a, b)
function Get-LCM {
    param(
        [int]$num1,
        [int]$num2
    )
    
    # Calculate the product of the numbers
    $product = $num1 * $num2
    
    # Calculate the GCD using the defined function
    $gcd = Get-GCD $num1 $num2
    
    # Calculate the LCM using the formula and return it
    return $product / $gcd
}

# Define a function to find the GCD of two fractions
function Get-Fractions-GCD {
    param(
        [int]$Numerator_Uno,
        [int]$Denominator_Uno,
        [int]$Numerator_Dos,
        [int]$Denominator_Dos
    )

    # Calculate the GCD of the denominators
    $Fractions_GCD = Get-GCD $Denominator_Uno $Denominator_Dos

    Rabbit_Speaks "The greatest common denominator of ($Numerator_Uno/$Denominator_Uno) and ($Numerator_Dos/$Denominator_Dos) is: $Fractions_GCD"
}

function Get-Equal-Denominators {
    param(
        [int]$Numerator_One,
        [int]$Denominator_One,
        [int]$Numerator_Two,
        [int]$Denominator_Two
    )
    
    # Calculate the least common multiple (LCM) of the denominators
    $lcm = Get-LCM $Denominator_One $Denominator_Two
    

    # Calculate the resizing factors
    $Factorino_One = $lcm / $Denominator_One
    $Factorino_Two = $lcm / $Denominator_Two
    
    # Resize the fractions
    $Resized_Numerator_One = $Numerator_One * $Factorino_One
    $Resized_Numerator_Two = $Numerator_Two * $Factorino_Two
    
    # Output the resized fractions
    Rabbit_Speaks "The LCM or LCD of these fractions is $lcm, so $Numerator_One/$Denominator_One with a factor of $Factorino_One = $($Resized_Numerator_One)/$($lcm) and $Numerator_Two/$Denominator_Two with a factor of $Factorino_Two = $($Resized_Numerator_Two)/$($lcm)"
}

function Get-Fraction-Reduction {
    param (
        [int]$Numbarator,
        [int]$Denobinator
    )

    $gcd = Get-GCD $Numbarator $Denobinator

    # Reduce the fraction
    $Reduced_Numbarator = $Numbarator / $gcd
    $Reduced_Denobinator = $Denobinator / $gcd
    if ($Reduced_Denobinator -eq 1) {
        Rabbit_Speaks "The reduced fraction result is: $Reduced_Numbarator"
    }
    elseif ($Reduced_Numbarator -eq $Reduced_Denobinator){
        Rabbit_Speaks "The reduced fraction result is: 1"
    }
    else {
    Rabbit_Speaks "The reduced fraction result is: $Reduced_Numbarator/$Reduced_Denobinator"
    }
}

function Get-Fractions-Added {
        param (
        [int]$num1,
        [int]$denom1,
        [int]$num2,
        [int]$denom2
    )

    $lcd = Get-LCM $denom1 $denom2
    # Calculate the numerators for the common denominator
    $newNum1 = $num1 * ($lcd / $denom1)
    $newNum2 = $num2 * ($lcd / $denom2)

    # Add the numerators
    $sum = $newNum1 + $newNum2
    Rabbit_Speaks "The non reduced fraction result is: $sum/$lcd"
    $Reduction_Baby = Get-Fraction-Reduction $sum $lcd
    $Reduction_Baby
}

function Get-Fractions-Subtracted {
        param (
        [int]$num1,
        [int]$denom1,
        [int]$num2,
        [int]$denom2
    )

    $lcd = Get-LCM $denom1 $denom2
    # Calculate the numerators for the common denominator
    $newNum1 = $num1 * ($lcd / $denom1)
    $newNum2 = $num2 * ($lcd / $denom2)

    # Subtract the numerators
    $sum = $newNum1 - $newNum2

    Rabbit_Speaks "The non reduced fraction result is: $sum/$lcd"
    $Reduction_Baby = Get-Fraction-Reduction $sum $lcd
    $Reduction_Baby
}

function Get-Fractions-Multiplied {
        param (
        [int]$num1,
        [int]$denom1,
        [int]$num2,
        [int]$denom2
    )

    # Multiply the numerators and denominators separately
    $resultNum = $num1 * $num2
    $resultDenom = $denom1 * $denom2

    Rabbit_Speaks "The non reduced fraction result is: $resultNum/$resultDenom"
    $Reduction_Baby = Get-Fraction-Reduction $resultNum $resultDenom
    $Reduction_Baby
}

function Get-Fractions-Divided {
        param (
        [int]$numerator1,
        [int]$denominator1,
        [int]$numerator2,
        [int]$denominator2
    )

    # Multiply the first fraction by the reciprocal of the second fraction
    $resultNumerator = $numerator1 * $denominator2
    $resultDenominator = $denominator1 * $numerator2

    Rabbit_Speaks "The non reduced fraction result is: $resultNumerator/$resultDenominator"
    $Reduction_Baby = Get-Fraction-Reduction $resultNumerator $resultDenominator
    $Reduction_Baby
}