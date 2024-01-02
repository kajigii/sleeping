const calendar = document.querySelector('.calendar');
const item = document.querySelector('.item');

let scrollAmount = 0;

function scroll(direction) {
  const scrollStep = 7; // スクロールのステップ数

  if (direction === 'left') {
    scrollAmount -= scrollStep;
  } else if (direction === 'right') {
    scrollAmount += scrollStep;
  }

  calendar.style.transform = `translateX(${scrollAmount}px)`;
}

// 左右の矢印ボタンがクリックされたときにスクロールを実行
document.getElementById('scroll-left').addEventListener('click', () => scroll('left'));
document.getElementById('scroll-right').addEventListener('click', () => scroll('right'));
