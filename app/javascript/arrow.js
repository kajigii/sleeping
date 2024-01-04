document.addEventListener('DOMContentLoaded', function () {
  const calendar = document.querySelector('.calendar');

  // 要素が存在するか確認
  if (calendar) {
    // スクロールを一番右に移動
    calendar.scrollLeft = calendar.scrollWidth;

    // 左矢印をクリックしたときの処理
    document.getElementById('scroll-left').addEventListener('click', function () {
      calendar.scrollLeft -= 50; // スクロールを左に50px移動
    });

    // 右矢印をクリックしたときの処理
    document.getElementById('scroll-right').addEventListener('click', function () {
      calendar.scrollLeft += 50; // スクロールを右に50px移動
    });
  } else {
    console.error('.calendar 要素が存在しません');
  }
});
