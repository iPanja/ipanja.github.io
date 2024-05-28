function responsiveNav() {
  var x = document.getElementById("nav");
  if (x.className === "rnav") {
    x.className += " responsive";
  } else {
    x.className = "rnav";
  }
}

//Toggle Button

const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');
const currentTheme = localStorage.getItem('theme');

if (currentTheme) {
    document.documentElement.setAttribute('data-theme', currentTheme);

    if (currentTheme === 'light') {
        toggleSwitch.checked = false;
    }
}
function switchTheme(e) {
	console.log(e.target.checked);
    if (e.target.checked) {
        document.documentElement.setAttribute('data-theme', 'dark');
        localStorage.setItem('theme', 'dark');
    }
    else {
		document.documentElement.setAttribute('data-theme', 'light');
        localStorage.setItem('theme', 'light');
    }
}

toggleSwitch.addEventListener('change', switchTheme, false);
