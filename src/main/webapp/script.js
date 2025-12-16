const contactForm = document.getElementById('contact-form');

if (contactForm) {
  contactForm.addEventListener('submit', function (e) {
    e.preventDefault();

    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const message = document.getElementById('message').value.trim();

    if (name && email && message) {
      alert('Thank you for contacting us! We will get back to you soon.');
      contactForm.reset();
    } else {
      alert('Please fill out all fields.');
    }
  });
}
