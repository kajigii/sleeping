document.addEventListener('DOMContentLoaded', function () {
  const calendar = document.querySelector('.calendar');

  // 要素が存在するか確認
  if (calendar) {
    // 表示されているデータの位置を管理する変数
    let currentVisibleDataIndex = 0;

    // 表示されているデータ数
    const visibleDataCount = 7;

    // 左矢印をクリックしたときの処理
    document.getElementById('scroll-left').addEventListener('click', function () {
      if (currentVisibleDataIndex > 0) {
        currentVisibleDataIndex -= 1;
        updateVisibleData();
      }
    });

    // 右矢印をクリックしたときの処理
    document.getElementById('scroll-right').addEventListener('click', function () {
      if (currentVisibleDataIndex < records.length - visibleDataCount) {
        currentVisibleDataIndex += 1;
        updateVisibleData();
      }
    });

    // 初期表示
    updateVisibleData();
  } else {
    console.error('.calendar 要素が存在しません');
  }

  function updateVisibleData() {
    // 表示するデータを更新
    const visibleData = records.slice(currentVisibleDataIndex, currentVisibleDataIndex + visibleDataCount);

    // ビューを更新
    updateView(visibleData);
  }

  function updateView(visibleData) {
    // ビューの更新処理をここに記述
    // 例: 表示されているデータを元に HTML を生成して表示する
  }
});
