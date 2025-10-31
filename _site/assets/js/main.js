document.getElementById('menuBtn')?.addEventListener('click', () => {
  const m = document.getElementById('menuList');
  if (!m) return;
  m.classList.toggle('hidden');
});
document.getElementById('year') && (document.getElementById('year').textContent = new Date().getFullYear());
