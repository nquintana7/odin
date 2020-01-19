let order = [];
let count = 0;
let numbers = [];
let temp = 0;
let tempstr = "";
let crashed = false;
let decimal = false;
function changeDisplayto (a) {
    if(document.getElementById("result").innerHTML == "0") {
    document.getElementById("result").innerHTML = a;
    tempstr += a;
    temp = parseFloat(tempstr);
} else {
    document.getElementById("result").insertAdjacentHTML("beforeend", a);
    tempstr += a;
    temp = parseFloat(tempstr);
}
}
function operationClick (operation) {
   numbers[count] = temp;
   order[count] = operation;
   count++;
   tempstr = "";
   temp = 0;
   decimal = false;
   switch(operation) {
        case("substract"):
        document.getElementById("result").insertAdjacentHTML("beforeend", "-");
        break;
        case("divide"):
        document.getElementById("result").insertAdjacentHTML("beforeend", "/");
        break;
        case("multiply"):
        document.getElementById("result").insertAdjacentHTML("beforeend", "*");
        break;
        case("add"):
        document.getElementById("result").insertAdjacentHTML("beforeend", "+");
        break;
   }
}
function equal (mycount, result, check, opera) {
    if(!check) {   
        if (mycount+1 == count) {
        return temp;
    }
    switch(order[mycount]) {
                case("add"):
                return numbers[mycount]+equal(mycount+1, 0, false, 0);
                case("substract"):
                return numbers[mycount]-equal(mycount+1, 0 , false, 0);
                case("divide"):
                return equal(mycount+1, numbers[mycount], true, "divide");
                case("multiply"):
                return equal(mycount+1, numbers[mycount], true, "multiply");
    }
    } else if (check) {
        if (mycount+1 == count) {
            if(opera == "divide") {
                if (temp == 0) {
                    crashed = true;
                    return 0;
                }
                return result/temp;
            } else if (opera == "multiply") {
                return result*temp;
            }
    }
        switch(opera) {
            case("divide"):
                if(numbers[mycount] == 0) {
                    crashed = true;
                    return 0;
                }
                switch(order[mycount]) {
                case("add"):
                return result/numbers[mycount]+equal(mycount+1, 0, false, 0);
                case("substract"):
                return result/numbers[mycount]-equal(mycount+1, 0 , false, 0);
                case("divide"):
                return equal(mycount+1, result/numbers[mycount], true, "divide");
                case("multiply"):
                return equal(mycount+1, result/numbers[mycount], true, "multiply");
    }
            case("multiply"):
            switch(order[mycount]) {
                case("add"):
                return result*numbers[mycount] + equal(mycount+1, 0, false, 0);
                case("substract"):
                return result*numbers[mycount] - equal(mycount+1, 0 , false, 0);
                case("divide"):
                return equal(mycount+1, result*numbers[mycount], true, "divide");
                case("multiply"):
                return equal(mycount+1, result*numbers[mycount], true, "multiply");
    }
    }
}
}
function equalButton () {
    count++;
    let x = equal(0, 0, false, 0);
    let str = "" + x;
    if (str.substring(str.indexOf(".")).length > 4) {
        x = x.toFixed(4);
    }
    if(crashed) {
        document.getElementById("result").style.cssText = "font-size: 20px;";
        document.getElementById("result").innerHTML = "CAN'T DIVIDE BY ZERO, <br>DON'T CRUSH ME PLEASE.";
    } else if (!crashed) {
        document.getElementById("result").innerHTML = x;
        temp = x;
    }
}
function clearAll() {
    order = [];
    numbers = [];
    count = 0;
    temp = 0;
    tempstr = "";
    decimal = false;
    document.getElementById("result").style.cssText = "font-size: 2.4em;";
    document.getElementById("result").innerHTML = 0;
}
function dotFunction() {
    if (!decimal) {
        document.getElementById("result").insertAdjacentHTML("beforeend", ".");
        tempstr += ".";
    }
    decimal = true;
}
function deleteLast() {
    if(tempstr.charAt(tempstr.length-1) == ".") decimal = false;
    tempstr = tempstr.substring(0, tempstr.length - 1);
    temp = parseFloat(tempstr);
    let mystring = document.getElementById("result").innerHTML;
    let niue = mystring.substring(0, mystring.length-1);
    document.getElementById("result").innerHTML = niue;
}
function checkKey(e) {
    var key = e.which || e.keyCode;
    if (key === 48) changeDisplayto(0);
    if (key === 49) changeDisplayto(1);
    if (key === 50) changeDisplayto(2);
    if (key === 51) changeDisplayto(3);
    if (key === 52) changeDisplayto(4);
    if (key === 53) changeDisplayto(5);
    if (key === 54) changeDisplayto(6);
    if (key === 55) changeDisplayto(7);
    if (key === 56) changeDisplayto(8);
    if (key === 57) changeDisplayto(9);
}
document.addEventListener("keypress", checkKey);