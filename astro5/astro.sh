#!/bin/bash

echo "🚀 Creando tienda de libros con Astro 5..."

# Crear directorio del proyecto
mkdir tienda-libros
cd tienda-libros

# Inicializar proyecto Astro
npm create astro@latest . -- --template minimal --yes --no-git

# Instalar dependencias adicionales
npm install @astrojs/tailwind tailwindcss @astrojs/react react react-dom

# Crear estructura de carpetas
mkdir -p src/components src/pages src/layouts src/data src/styles

# Crear archivo de configuración de Astro
cat > astro.config.mjs << 'EOF'
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';
import react from '@astrojs/react';

export default defineConfig({
  integrations: [tailwind(), react()],
  output: 'static'
});
EOF

# Crear layout principal
cat > src/layouts/Layout.astro << 'EOF'
---
export interface Props {
  title: string;
}

const { title } = Astro.props;
---

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Tienda de libros online" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <title>{title}</title>
  </head>
  <body class="min-h-screen bg-gray-50">
    <slot />
  </body>
</html>
EOF

# Crear componente Header
cat > src/components/Header.astro << 'EOF'
---
---

<header class="bg-white shadow-md">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between items-center py-6">
      <div class="flex items-center">
        <h1 class="text-2xl font-bold text-gray-900">📚 LibrosOnline</h1>
      </div>
      <nav class="hidden md:flex space-x-8">
        <a href="/" class="text-gray-700 hover:text-blue-600 font-medium">Inicio</a>
        <a href="/libros" class="text-gray-700 hover:text-blue-600 font-medium">Libros</a>
        <a href="/categorias" class="text-gray-700 hover:text-blue-600 font-medium">Categorías</a>
        <a href="/contacto" class="text-gray-700 hover:text-blue-600 font-medium">Contacto</a>
      </nav>
      <div class="flex items-center space-x-4">
        <button class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
          🛒 Carrito (0)
        </button>
      </div>
    </div>
  </div>
</header>
EOF

# Crear componente Footer
cat > src/components/Footer.astro << 'EOF'
---
---

<footer class="bg-gray-800 text-white mt-16">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
      <div>
        <h3 class="text-lg font-semibold mb-4">📚 LibrosOnline</h3>
        <p class="text-gray-400">Tu librería online favorita con los mejores títulos.</p>
      </div>
      <div>
        <h4 class="text-md font-semibold mb-4">Categorías</h4>
        <ul class="text-gray-400 space-y-2">
          <li><a href="#" class="hover:text-white">Ficción</a></li>
          <li><a href="#" class="hover:text-white">No Ficción</a></li>
          <li><a href="#" class="hover:text-white">Ciencia</a></li>
          <li><a href="#" class="hover:text-white">Historia</a></li>
        </ul>
      </div>
      <div>
        <h4 class="text-md font-semibold mb-4">Ayuda</h4>
        <ul class="text-gray-400 space-y-2">
          <li><a href="#" class="hover:text-white">Contacto</a></li>
          <li><a href="#" class="hover:text-white">Envíos</a></li>
          <li><a href="#" class="hover:text-white">Devoluciones</a></li>
          <li><a href="#" class="hover:text-white">FAQ</a></li>
        </ul>
      </div>
      <div>
        <h4 class="text-md font-semibold mb-4">Síguenos</h4>
        <div class="flex space-x-4">
          <a href="#" class="text-gray-400 hover:text-white">Facebook</a>
          <a href="#" class="text-gray-400 hover:text-white">Twitter</a>
          <a href="#" class="text-gray-400 hover:text-white">Instagram</a>
        </div>
      </div>
    </div>
    <div class="border-t border-gray-700 mt-8 pt-8 text-center text-gray-400">
      <p>&copy; 2025 LibrosOnline. Todos los derechos reservados.</p>
    </div>
  </div>
</footer>
EOF

# Crear componente BookCard
cat > src/components/BookCard.astro << 'EOF'
---
export interface Props {
  title: string;
  author: string;
  price: number;
  image: string;
  category: string;
}

const { title, author, price, image, category } = Astro.props;
---

<div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow">
  <img src={image} alt={title} class="w-full h-48 object-cover" />
  <div class="p-4">
    <span class="inline-block bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded-full mb-2">
      {category}
    </span>
    <h3 class="text-lg font-semibold text-gray-900 mb-1">{title}</h3>
    <p class="text-gray-600 mb-2">{author}</p>
    <div class="flex justify-between items-center">
      <span class="text-xl font-bold text-blue-600">${price}</span>
      <button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition-colors">
        Añadir al carrito
      </button>
    </div>
  </div>
</div>
EOF

# Crear datos de libros
cat > src/data/books.js << 'EOF'
export const books = [
  {
    id: 1,
    title: "Cien años de soledad",
    author: "Gabriel García Márquez",
    price: 18.99,
    image: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&h=600&fit=crop",
    category: "Ficción"
  },
  {
    id: 2,
    title: "El Quijote",
    author: "Miguel de Cervantes",
    price: 22.50,
    image: "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=600&fit=crop",
    category: "Clásicos"
  },
  {
    id: 3,
    title: "1984",
    author: "George Orwell",
    price: 16.75,
    image: "https://images.unsplash.com/photo-1589998059171-988d887df646?w=400&h=600&fit=crop",
    category: "Distopía"
  },
  {
    id: 4,
    title: "El principito",
    author: "Antoine de Saint-Exupéry",
    price: 12.99,
    image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop",
    category: "Infantil"
  },
  {
    id: 5,
    title: "Sapiens",
    author: "Yuval Noah Harari",
    price: 24.99,
    image: "https://images.unsplash.com/photo-1532012197267-da84d127e765?w=400&h=600&fit=crop",
    category: "Historia"
  },
  {
    id: 6,
    title: "El código Da Vinci",
    author: "Dan Brown",
    price: 19.99,
    image: "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=600&fit=crop",
    category: "Misterio"
  }
];
EOF

# Crear página principal
cat > src/pages/index.astro << 'EOF'
---
import Layout from '../layouts/Layout.astro';
import Header from '../components/Header.astro';
import Footer from '../components/Footer.astro';
import BookCard from '../components/BookCard.astro';
import { books } from '../data/books.js';

const featuredBooks = books.slice(0, 3);
---

<Layout title="LibrosOnline - Tu librería favorita">
  <Header />
  
  <main>
    <!-- Hero Section -->
    <section class="bg-gradient-to-r from-blue-600 to-purple-700 text-white py-20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h1 class="text-4xl md:text-6xl font-bold mb-6">
          Descubre tu próxima lectura
        </h1>
        <p class="text-xl mb-8 max-w-2xl mx-auto">
          Miles de libros te esperan. Desde clásicos hasta novedades, encuentra la historia perfecta para ti.
        </p>
        <button class="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-colors">
          Explorar libros
        </button>
      </div>
    </section>

    <!-- Featured Books -->
    <section class="py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-gray-900 mb-8 text-center">Libros destacados</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {featuredBooks.map(book => (
            <BookCard
              title={book.title}
              author={book.author}
              price={book.price}
              image={book.image}
              category={book.category}
            />
          ))}
        </div>
        <div class="text-center mt-12">
          <a href="/libros" class="bg-blue-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors">
            Ver todos los libros
          </a>
        </div>
      </div>
    </section>

    <!-- Categories -->
    <section class="bg-gray-100 py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-gray-900 mb-8 text-center">Categorías populares</h2>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
          <div class="bg-white p-6 rounded-lg text-center hover:shadow-md transition-shadow">
            <div class="text-4xl mb-4">📚</div>
            <h3 class="font-semibold">Ficción</h3>
          </div>
          <div class="bg-white p-6 rounded-lg text-center hover:shadow-md transition-shadow">
            <div class="text-4xl mb-4">🔬</div>
            <h3 class="font-semibold">Ciencia</h3>
          </div>
          <div class="bg-white p-6 rounded-lg text-center hover:shadow-md transition-shadow">
            <div class="text-4xl mb-4">🏛️</div>
            <h3 class="font-semibold">Historia</h3>
          </div>
          <div class="bg-white p-6 rounded-lg text-center hover:shadow-md transition-shadow">
            <div class="text-4xl mb-4">👑</div>
            <h3 class="font-semibold">Clásicos</h3>
          </div>
        </div>
      </div>
    </section>
  </main>

  <Footer />
</Layout>
EOF

# Crear página de libros
cat > src/pages/libros.astro << 'EOF'
---
import Layout from '../layouts/Layout.astro';
import Header from '../components/Header.astro';
import Footer from '../components/Footer.astro';
import BookCard from '../components/BookCard.astro';
import { books } from '../data/books.js';
---

<Layout title="Todos los libros - LibrosOnline">
  <Header />
  
  <main class="py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <h1 class="text-3xl font-bold text-gray-900 mb-8">Todos nuestros libros</h1>
      
      <!-- Filtros -->
      <div class="mb-8 flex flex-wrap gap-4">
        <button class="bg-blue-600 text-white px-4 py-2 rounded-lg">Todos</button>
        <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300">Ficción</button>
        <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300">Historia</button>
        <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300">Clásicos</button>
        <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300">Infantil</button>
      </div>

      <!-- Lista de libros -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
        {books.map(book => (
          <BookCard
            title={book.title}
            author={book.author}
            price={book.price}
            image={book.image}
            category={book.category}
          />
        ))}
      </div>
    </div>
  </main>

  <Footer />
</Layout>
EOF

# Crear página de contacto
cat > src/pages/contacto.astro << 'EOF'
---
import Layout from '../layouts/Layout.astro';
import Header from '../components/Header.astro';
import Footer from '../components/Footer.astro';
---

<Layout title="Contacto - LibrosOnline">
  <Header />
  
  <main class="py-12">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
      <h1 class="text-3xl font-bold text-gray-900 mb-8 text-center">Contacto</h1>
      
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
        <!-- Formulario -->
        <div>
          <h2 class="text-xl font-semibold mb-6">Envíanos un mensaje</h2>
          <form class="space-y-6">
            <div>
              <label for="name" class="block text-sm font-medium text-gray-700 mb-2">Nombre</label>
              <input type="text" id="name" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>
            <div>
              <label for="email" class="block text-sm font-medium text-gray-700 mb-2">Email</label>
              <input type="email" id="email" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>
            <div>
              <label for="message" class="block text-sm font-medium text-gray-700 mb-2">Mensaje</label>
              <textarea id="message" rows="4" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
            </div>
            <button type="submit" class="w-full bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 transition-colors">
              Enviar mensaje
            </button>
          </form>
        </div>

        <!-- Información de contacto -->
        <div>
          <h2 class="text-xl font-semibold mb-6">Información de contacto</h2>
          <div class="space-y-4">
            <div class="flex items-center">
              <div class="text-2xl mr-4">📍</div>
              <div>
                <h3 class="font-medium">Dirección</h3>
                <p class="text-gray-600">Calle de los Libros, 123<br>28001 Madrid, España</p>
              </div>
            </div>
            <div class="flex items-center">
              <div class="text-2xl mr-4">📞</div>
              <div>
                <h3 class="font-medium">Teléfono</h3>
                <p class="text-gray-600">+34 91 234 5678</p>
              </div>
            </div>
            <div class="flex items-center">
              <div class="text-2xl mr-4">✉️</div>
              <div>
                <h3 class="font-medium">Email</h3>
                <p class="text-gray-600">info@librosonline.com</p>
              </div>
            </div>
            <div class="flex items-center">
              <div class="text-2xl mr-4">🕒</div>
              <div>
                <h3 class="font-medium">Horario</h3>
                <p class="text-gray-600">Lunes a Viernes: 9:00 - 18:00<br>Sábados: 10:00 - 14:00</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <Footer />
</Layout>
EOF

# Crear favicon
cat > public/favicon.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
  <text x="0" y="24" font-size="24">📚</text>
</svg>
EOF

# Configurar Tailwind
npx tailwindcss init -p

# Actualizar configuración de Tailwind
cat > tailwind.config.mjs << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

# Crear archivo de estilos globales
cat > src/styles/global.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

html {
  font-family: system-ui, sans-serif;
}
EOF

echo "✅ Tienda de libros creada exitosamente!"
echo ""
echo "Para iniciar el proyecto:"
echo "  cd tienda-libros"
echo "  npm run dev"
echo ""
echo "Para construir el proyecto para producción:"
echo "  npm run build"
echo ""
echo "🎉 ¡Tu tienda de libros está lista!"