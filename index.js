window.onload = function () {

    var oTab = document.querySelector('.tab');
    var aLi = oTab.querySelectorAll('li');
    var aBox = document.querySelector('.box');
    for (var i = 0; i < aLi.length; i++) {
        aLi[i].index = i;
        aLi[i].onclick = function () {
            for (var j = 0; j < aLi.length; j++) {
                aLi[j].className = '';//取消所有选中tab
                // aBox[j].className = 'show';//隐藏所有的tabDiv
            }
            aLi[this.index].className = 'active';
            // aBox[this.index].className = '';
        }
    }
}
