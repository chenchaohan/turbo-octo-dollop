window.onload = function () {
  var oTab = document.querySelector('.tab');
  var aLi = oTab.querySelectorAll('li');
  var aBox = document.querySelector('.box');
  for (var i = 0; i < aLi.length; i++) {
    aLi[i].index = i;
    aLi[i].onclick = function () {
      for (var j = 0; j < aLi.length; j++) {
        aLi[j].className = ''; //取消所有选中tab
        // aBox[j].className = 'show';//隐藏所有的tabDiv
      }
      aLi[this.index].className = 'active';
      // aBox[this.index].className = '';
    };
  }
};

function getScrollTop() {
  var scrollTop = 0,
    bodyScrollTop = 0,
    documentScrollTop = 0;
  if (document.body) {
    bodyScrollTop = document.body.scrollTop;
  }
  if (document.documentElement) {
    documentScrollTop = document.documentElement.scrollTop;
  }
  scrollTop = bodyScrollTop - documentScrollTop > 0 ? bodyScrollTop : documentScrollTop;
  return scrollTop;
}
function getScrollHeight() {
  var scrollHeight = 0,
    bodyScrollHeight = 0,
    documentScrollHeight = 0;
  if (document.body) {
    bodyScrollHeight = document.body.scrollHeight;
  }
  if (document.documentElement) {
    documentScrollHeight = document.documentElement.scrollHeight;
  }
  scrollHeight = bodyScrollHeight - documentScrollHeight > 0 ? bodyScrollHeight : documentScrollHeight;
  return scrollHeight;
}
function getWindowHeight() {
  var windowHeight = 0;
  if (document.compatMode == 'CSS1Compat') {
    windowHeight = document.documentElement.clientHeight;
  } else {
    windowHeight = document.body.clientHeight;
  }
  return windowHeight;
}
var isScrollB0ttom = function () {
  if (getScrollHeight() - getScrollTop() - getWindowHeight() < 50) {
    // 模拟请求下一页
    document.getElementById('loading-text').innerText = '加载中';
    setTimeout(() => {
      // 请求完成
      document.getElementById('loading-text').innerText = '加载完成';
    }, 1000);

    //解除绑定
    window.removeEventListener('scroll', isScrollB0ttom, false);
    //ajax数据请求
    //数据渲染后再次绑定监听事件window.addEventListener('scroll',isScrollB0ttom ,false);
  }
};
window.addEventListener('scroll', isScrollB0ttom, false);
