// Navegación móvil
const hamburger = document.querySelector('.hamburger');
const navMenu = document.querySelector('.nav-menu');
const navLinks = document.querySelectorAll('.nav-link');

hamburger.addEventListener('click', () => {
    hamburger.classList.toggle('active');
    navMenu.classList.toggle('active');
});

// Cerrar menú al hacer click en un enlace
navLinks.forEach(link => {
    link.addEventListener('click', () => {
        hamburger.classList.remove('active');
        navMenu.classList.remove('active');
    });
});

// Cambiar enlace activo al hacer scroll
window.addEventListener('scroll', () => {
    const sections = document.querySelectorAll('section[id]');
    const scrollY = window.pageYOffset;
    
    sections.forEach(section => {
        const sectionHeight = section.offsetHeight;
        const sectionTop = section.offsetTop - 100;
        const sectionId = section.getAttribute('id');
        const correspondingLink = document.querySelector(`.nav-link[href="#${sectionId}"]`);
        
        if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
            if (correspondingLink) {
                navLinks.forEach(link => link.classList.remove('active'));
                correspondingLink.classList.add('active');
            }
        }
    });
});

// Formulario de reserva
const reservaForm = document.getElementById('form-reserva');
if (reservaForm) {
    reservaForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Validación básica
        const nombre = this.querySelector('input[type="text"]').value;
        const telefono = this.querySelector('input[type="tel"]').value;
        const email = this.querySelector('input[type="email"]').value;
        const fecha = this.querySelector('input[type="date"]').value;
        const personas = this.querySelector('select').value;
        
        if (!nombre || !telefono || !email || !fecha || !personas) {
            alert('Por favor, complete todos los campos obligatorios.');
            return;
        }
        
        // Simulación de envío
        alert(`¡Reserva enviada con éxito!\n\nNombre: ${nombre}\nTeléfono: ${telefono}\nFecha: ${fecha}\nPersonas: ${personas}\n\nTe contactaremos para confirmar.`);
        
        // Resetear formulario
        this.reset();
    });
}

// Formulario de newsletter
const newsletterForm = document.querySelector('.newsletter-form');
if (newsletterForm) {
    newsletterForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const emailInput = this.querySelector('input[type="email"]');
        
        if (!emailInput.value || !isValidEmail(emailInput.value)) {
            alert('Por favor, introduce un email válido.');
            return;
        }
        
        alert('¡Gracias por suscribirte a nuestro newsletter!');
        emailInput.value = '';
    });
}

// Función para validar email
function isValidEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

// Efecto de aparición al hacer scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('animate');
        }
    });
}, observerOptions);

// Observar elementos para animación
document.querySelectorAll('.especialidad-card, .carta-category, .info-item').forEach(el => {
    observer.observe(el);
});

// Configurar fecha mínima en el formulario de reserva (hoy)
const fechaInput = document.querySelector('input[type="date"]');
if (fechaInput) {
    const today = new Date().toISOString().split('T')[0];
    fechaInput.min = today;
    
    // Establecer fecha por defecto (mañana)
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    fechaInput.value = tomorrow.toISOString().split('T')[0];
}

// Smooth scroll para enlaces internos
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        
        const targetId = this.getAttribute('href');
        if (targetId === '#') return;
        
        const targetElement = document.querySelector(targetId);
        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop - 80,
                behavior: 'smooth'
            });
        }
    });
});

// Cambiar color del header al hacer scroll
window.addEventListener('scroll', () => {
    const header = document.querySelector('.header');
    if (window.scrollY > 100) {
        header.style.boxShadow = '0 4px 20px rgba(0, 0, 0, 0.1)';
    } else {
        header.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1)';
    }
});

// Inicialización
document.addEventListener('DOMContentLoaded', () => {
    console.log('Página de El Rincón del Tapeo II cargada correctamente');
    
    // Añadir clase inicial para animaciones
    setTimeout(() => {
        document.body.classList.add('loaded');
    }, 100);
});