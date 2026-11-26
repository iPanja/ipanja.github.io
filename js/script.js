function responsiveNav() {
  const nav = document.getElementById("nav");
  const menuToggle = nav.querySelector(".icon");
  const isExpanded = nav.classList.toggle("responsive");

  menuToggle.setAttribute("aria-expanded", String(isExpanded));
  menuToggle.setAttribute("aria-label", isExpanded ? "Close navigation menu" : "Open navigation menu");
  menuToggle.textContent = isExpanded ? "×" : "☰";
}

const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');
const currentTheme = localStorage.getItem("theme");

if (currentTheme) {
  document.documentElement.setAttribute("data-theme", currentTheme);
  toggleSwitch.checked = currentTheme === "dark";
}

function switchTheme(event) {
  const theme = event.target.checked ? "dark" : "light";
  document.documentElement.setAttribute("data-theme", theme);
  localStorage.setItem("theme", theme);
}

if (toggleSwitch) {
  toggleSwitch.addEventListener("change", switchTheme, false);
}
