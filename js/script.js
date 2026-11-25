function responsiveNav() {
  const nav = document.getElementById("nav");
  nav.classList.toggle("responsive");
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
