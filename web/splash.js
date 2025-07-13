// splash.js

// Tunggu sampai Flutter siap 100%
window.addEventListener('load', function () {
  const loader = document.getElementById("loader");

  if (!loader) return;

  // Tunggu sampai frame utama Flutter muncul
  const observer = new MutationObserver(() => {
    const flutterRoot = document.querySelector("flt-glass-pane, flutter-view");

    if (flutterRoot) {
      // Flutter sudah muncul di DOM
      loader.style.opacity = "0";
      loader.style.transition = "opacity 0.3s ease";

      setTimeout(() => {
        loader.remove();
      }, 300);

      observer.disconnect();
    }
  });

  observer.observe(document.body, {
    childList: true,
    subtree: true,
  });
});