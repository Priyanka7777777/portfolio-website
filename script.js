// Typewriter
const text = "Hi, I'm Priyanka 👩‍💻";
let i = 0;
function typeWriter() {
  if (i < text.length) {
    document.getElementById("typewriter").innerHTML += text.charAt(i);
    i++;
    setTimeout(typeWriter, 100);
  }
}
typeWriter();

// Theme Toggle
document.getElementById('toggle-theme').onclick = () => {
  document.body.classList.toggle('dark');
};

// Project Filter
function filterProjects(tag) {
  const projects = document.querySelectorAll(".project");
  projects.forEach(p => {
    if (tag === 'all' || p.classList.contains(tag)) {
      p.style.display = 'list-item';
    } else {
      p.style.display = 'none';
    }
  });
}

