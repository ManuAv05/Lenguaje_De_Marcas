let productosCargados = false;

document.getElementById("mostrar-btn").addEventListener("click", () => {
    const contenedor = document.getElementById("lista-productos");

    if (!productosCargados) {
        fetch('productos.xml')
            .then(res => res.text())
            .then(data => {
                const parser = new DOMParser();
                const xmlDoc = parser.parseFromString(data, "application/xml");
                const productos = xmlDoc.getElementsByTagName("Producto");

                for (let producto of productos) {
                    const nombre = producto.getElementsByTagName("Nombre")[0].textContent;
                    const precio = producto.getElementsByTagName("Precio")[0].textContent;
                    const etiquetas = [...producto.getElementsByTagName("Etiqueta")].map(et => et.textContent);

                    const div = document.createElement("div");
                    div.className = "producto";
                    div.innerHTML = `
            <h2>${nombre}</h2>
            <p><strong>Precio:</strong> $${precio}</p>
            <div class="etiquetas">
              ${etiquetas.map(e => `<span>${e}</span>`).join('')}
            </div>
          `;
                    contenedor.appendChild(div);
                }

                productosCargados = true;
                contenedor.classList.remove("oculto");
                document.getElementById("mostrar-btn").textContent = "Ocultar productos";
            })
            .catch(error => {
                console.error("Error cargando el XML:", error);
            });
    } else {
        contenedor.classList.toggle("oculto");

        const btn = document.getElementById("mostrar-btn");
        btn.textContent = contenedor.classList.contains("oculto")
            ? "Mostrar productos"
            : "Ocultar productos";
    }
});
