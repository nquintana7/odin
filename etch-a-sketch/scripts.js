let container = document.getElementsByClassName("container")[0];
let width = document.getElementsByClassName("container")[0].clientWidth;
let height = document.getElementsByClassName("container")[0].clientHeight;
let mode = "black";
let size = 16;
createGrid(size, mode);
document.getElementById("button1").addEventListener("click", function remoCrea(){
    var divs = document.querySelectorAll("div1");
    for (i = 0; i < divs.length; ++i) {
        divs[i].parentNode.removeChild(divs[i]);
    }
    let size = prompt("How many squares per size this time?");
    createGrid(size, mode);
})
document.getElementById("button2").addEventListener("click", function () {
    mode = "rainbow";
    var divs = document.querySelectorAll("div1");
    for (i = 0; i < divs.length; ++i) {
        divs[i].parentNode.removeChild(divs[i]);
    }
    let size = prompt("How many squares per size this time?");
    createGrid(size, mode);
})
function createGrid(size, mode) {
for (i = 0; i < size*size; i++) {
    let color = "black";
    if (mode == "rainbow") {
        color = '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
    }
    let div = document.createElement("div1");
    div.style.cssText = "float: left; position: relative; width: " + width/size + "px; height: " + height/size + "px;";
    container.appendChild(div);
    div.addEventListener("mouseover", function toBlack(){
        div.style.backgroundColor = color;
        div.removeEventListener("mouseover", toBlack, false);
    },false)
}
}