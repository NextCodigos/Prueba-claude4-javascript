# 🚀 Ejercicios JavaScript - De Cero a Medio

Una colección completa de ejercicios de JavaScript organizados por niveles de dificultad, desde principiante hasta intermedio. Incluye una página web interactiva para ejecutar y visualizar los resultados.

## 📋 Contenido

- [🌱 Nivel Principiante](#-nivel-principiante)
- [🔥 Nivel Básico](#-nivel-básico) 
- [💪 Nivel Intermedio](#-nivel-intermedio)
- [🚀 Cómo usar](#-cómo-usar)
- [🛠️ Tecnologías](#️-tecnologías)
- [📱 Características](#-características)

## 🌱 Nivel Principiante

### Ejercicio 1: Variables y operaciones básicas
Crear variables para nombre, edad y ciudad, y mostrar un mensaje personalizado.

```javascript
let nombre = "Ana";
let edad = 25;
let ciudad = "Madrid";
console.log(`Hola, soy ${nombre}, tengo ${edad} años y vivo en ${ciudad}`);
```

### Ejercicio 2: Calculadora simple
Función que realiza operaciones básicas entre dos números.

```javascript
function calculadora(a, b) {
    return {
        suma: a + b,
        resta: a - b,
        multiplicacion: a * b,
        division: a / b
    };
}
```

### Ejercicio 3: Par o impar
Determinar si un número es par o impar.

```javascript
function parOImpar(numero) {
    return numero % 2 === 0 ? "Par" : "Impar";
}
```

### Ejercicio 4: Mayor de tres números
Encontrar el número mayor entre tres valores.

```javascript
function mayorDeTres(a, b, c) {
    return Math.max(a, b, c);
}
```

## 🔥 Nivel Básico

### Ejercicio 5: Contar vocales
Contar el número de vocales en una palabra.

```javascript
function contarVocales(palabra) {
    let vocales = "aeiouAEIOU";
    let contador = 0;
    for (let letra of palabra) {
        if (vocales.includes(letra)) {
            contador++;
        }
    }
    return contador;
}
```

### Ejercicio 6: Tabla de multiplicar
Generar la tabla de multiplicar de un número.

```javascript
function tablaMultiplicar(numero) {
    for (let i = 1; i <= 10; i++) {
        console.log(`${numero} x ${i} = ${numero * i}`);
    }
}
```

### Ejercicio 7: Invertir texto
Invertir el orden de los caracteres de un texto.

```javascript
function invertirTexto(texto) {
    return texto.split("").reverse().join("");
}
```

### Ejercicio 8: FizzBuzz
El clásico problema de programación con números del 1 al 100.

```javascript
function fizzBuzz() {
    for (let i = 1; i <= 100; i++) {
        if (i % 15 === 0) {
            console.log("FizzBuzz");
        } else if (i % 3 === 0) {
            console.log("Fizz");
        } else if (i % 5 === 0) {
            console.log("Buzz");
        } else {
            console.log(i);
        }
    }
}
```

## 💪 Nivel Intermedio

### Ejercicio 9: Gestión de lista de tareas
Sistema completo para manejar una lista de tareas.

```javascript
const listaTareas = {
    tareas: [],
    
    agregar(tarea) {
        this.tareas.push({
            id: Date.now(),
            texto: tarea,
            completada: false
        });
    },
    
    completar(id) {
        let tarea = this.tareas.find(t => t.id === id);
        if (tarea) tarea.completada = true;
    },
    
    eliminar(id) {
        this.tareas = this.tareas.filter(t => t.id !== id);
    },
    
    mostrar() {
        return this.tareas.map(t => 
            `${t.completada ? '✅' : '❌'} ${t.texto}`
        );
    }
};
```

### Ejercicio 10: Calculadora de notas
Análisis estadístico de un array de calificaciones.

```javascript
function calculadoraNotas(notas) {
    let promedio = notas.reduce((sum, nota) => sum + nota, 0) / notas.length;
    let mayor = Math.max(...notas);
    let menor = Math.min(...notas);
    let aprobadas = notas.filter(nota => nota >= 6).length;
    
    return {
        promedio: promedio.toFixed(2),
        notaMayor: mayor,
        notaMenor: menor,
        aprobadas: aprobadas
    };
}
```

### Ejercicio 11: Buscador en array
Buscar elementos en un array con información detallada.

```javascript
function buscarEnArray(array, elemento) {
    let encontrado = array.includes(elemento);
    let posicion = array.indexOf(elemento);
    let veces = array.filter(item => item === elemento).length;
    
    return {
        encontrado: encontrado,
        posicion: posicion !== -1 ? posicion : "No encontrado",
        apariciones: veces
    };
}
```

### Ejercicio 12: Contador de palabras
Análisis completo de texto con estadísticas de palabras.

```javascript
function contadorPalabras(texto) {
    let palabras = texto.toLowerCase().split(/\s+/);
    let palabraLarga = palabras.reduce((a, b) => a.length > b.length ? a : b);
    
    // Contar cada palabra
    let contador = {};
    palabras.forEach(palabra => {
        contador[palabra] = (contador[palabra] || 0) + 1;
    });
    
    return {
        totalPalabras: palabras.length,
        palabraMasLarga: palabraLarga,
        contadorPalabras: contador
    };
}
```

## 🚀 Cómo usar

### Opción 1: Página Web Interactiva
1. Descarga el archivo `index.html`
2. Ábrelo en tu navegador
3. Haz clic en los botones "Ejecutar" para ver los resultados
4. Estudia el código que aparece debajo de cada ejercicio

### Opción 2: Consola del Navegador
1. Abre las herramientas de desarrollador (F12)
2. Ve a la pestaña "Console"
3. Copia y pega cualquier función
4. Prueba ejecutándola con diferentes parámetros

### Opción 3: Node.js
```bash
# Instalar Node.js y ejecutar
node ejercicios.js
```

## 🛠️ Tecnologías

- **HTML5** - Estructura de la página
- **CSS3** - Estilos modernos con gradientes y animaciones
- **JavaScript ES6+** - Funciones y sintaxis moderna
- **Responsive Design** - Compatible con móviles y tablets

## 📱 Características

- ✅ **Interfaz moderna** con diseño atractivo
- ✅ **Código coloreado** para mejor legibilidad
- ✅ **Ejecución en tiempo real** con botones interactivos
- ✅ **Responsive** - funciona en cualquier dispositivo
- ✅ **Sin dependencias** - funciona directamente en el navegador
- ✅ **Progresión gradual** de dificultad
- ✅ **Comentarios explicativos** en el código

## 🎯 Conceptos Clave Cubiertos

### Variables y Tipos de Datos
- `let`, `const`, `var`
- Strings, números, booleanos
- Template literals (`` `${variable}` ``)

### Funciones
- Declaración de funciones
- Funciones flecha
- Parámetros y return

### Arrays
- `push()`, `pop()`, `filter()`, `map()`, `reduce()`
- `find()`, `includes()`, `indexOf()`
- Spread operator (`...array`)

### Objetos
- Creación y manipulación de objetos
- Métodos de objetos
- `this` keyword

### Control de Flujo
- `if`, `else`, `switch`
- Bucles: `for`, `while`, `for...of`
- Operadores lógicos y de comparación

### Métodos de String
- `split()`, `join()`, `includes()`
- `toLowerCase()`, `toUpperCase()`
- Expresiones regulares básicas

## 🤝 Contribuir

¿Tienes ideas para más ejercicios? ¡Las contribuciones son bienvenidas!

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b nuevo-ejercicio`)
3. Commit tus cambios (`git commit -am 'Añadir nuevo ejercicio'`)
4. Push a la rama (`git push origin nuevo-ejercicio`)
5. Crea un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - mira el archivo [LICENSE](LICENSE) para más detalles.

## 📞 Contacto

¿Preguntas o sugerencias? 

- 📧 Email: tu-email@ejemplo.com
- 🐦 Twitter: [@tu_usuario](https://twitter.com/tu_usuario)
- 💼 LinkedIn: [Tu Perfil](https://linkedin.com/in/tu-perfil)

---

⭐ **¡Si este proyecto te ayudó, dale una estrella!** ⭐

## 🎓 Recursos Adicionales

### Para seguir aprendiendo:
- [MDN Web Docs - JavaScript](https://developer.mozilla.org/es/docs/Web/JavaScript)
- [JavaScript.info](https://javascript.info/)
- [FreeCodeCamp](https://www.freecodecamp.org/)
- [Eloquent JavaScript](https://eloquentjavascript.net/)

### Próximos pasos sugeridos:
1. **DOM Manipulation** - Interactuar con elementos HTML
2. **Async/Await** - Programación asíncrona
3. **APIs** - Consumir datos externos
4. **Frameworks** - React, Vue, Angular
5. **Node.js** - JavaScript en el servidor

---

*Creado con ❤️ para ayudar a aprender JavaScript*
