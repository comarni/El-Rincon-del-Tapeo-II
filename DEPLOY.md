# Instrucciones para Desplegar en GitHub Pages

Sigue estos pasos para subir tu sitio web a GitHub Pages:

## Paso 1: Crear Repositorio en GitHub

1. Ve a [GitHub](https://github.com)
2. Haz click en "+" (arriba derecha) → "New repository"
3. Configura el repositorio:
   - **Repository name**: `El-Rincon-del-Tapeo-II`
   - **Description**: Sitio web del bar El Rincón del Tapeo II en Alcobendas
   - **Public** (seleccionado)
   - **Initialize this repository with:**
     - ☑ Add a README file (opcional)
     - ☐ Add .gitignore (ya tenemos uno)
     - ☐ Choose a license (ya tenemos uno)
4. Haz click en "Create repository"

## Paso 2: Subir Código Local a GitHub

Abre PowerShell/CMD en la carpeta del proyecto y ejecuta:

```powershell
# Navegar a la carpeta del proyecto
cd "C:\Users\marko\Desktop\OpenClaw\El-Rincon-del-Tapeo-II"

# Inicializar repositorio Git
git init

# Agregar todos los archivos
git add .

# Hacer primer commit
git commit -m "Primera versión del sitio web"

# Conectar con repositorio remoto (REEMPLAZA con tu URL)
git remote add origin https://github.com/comarni/El-Rincon-del-Tapeo-II.git

# Subir a GitHub
git branch -M main
git push -u origin main
```

## Paso 3: Configurar GitHub Pages

1. En GitHub, ve a tu repositorio
2. Click en "Settings" (pestaña superior derecha)
3. En el menú izquierdo, click en "Pages"
4. En "Source", selecciona:
   - **Branch**: `main`
   - **Folder**: `/ (root)`
5. Click en "Save"
6. Espera unos minutos (puede tomar hasta 10 minutos)

## Paso 4: Acceder a tu Sitio Web

Tu sitio estará disponible en:
```
https://comarni.github.io/El-Rincon-del-Tapeo-II/
```

## Paso 5: Actualizaciones Futuras

Para actualizar el sitio después de hacer cambios:

```powershell
cd "C:\Users\marko\Desktop\OpenClaw\El-Rincon-del-Tapeo-II"

# Ver cambios
git status

# Agregar cambios
git add .

# Hacer commit
git commit -m "Descripción de los cambios"

# Subir a GitHub
git push
```

## Solución de Problemas

### Error: "remote origin already exists"
```powershell
git remote remove origin
git remote add origin https://github.com/comarni/El-Rincon-del-Tapeo-II.git
```

### Error: Autenticación
Necesitarás un token de acceso personal:
1. Ve a GitHub → Settings → Developer settings → Personal access tokens
2. Crea un nuevo token con permisos "repo"
3. Usa el token como contraseña cuando Git te lo pida

### El sitio no se actualiza
- GitHub Pages puede tardar hasta 10 minutos en actualizarse
- Verifica que el commit se haya subido correctamente
- Revisa la pestaña "Actions" en GitHub para ver si hay errores

## Características del Sitio Desplegado

✅ **URL pública**: https://comarni.github.io/El-Rincon-del-Tapeo-II/  
✅ **HTTPS automático**  
✅ **CDN global** (rápido en todo el mundo)  
✅ **Sin coste** (gratuito con GitHub)  
✅ **Actualizaciones automáticas** al hacer push  

## Personalización Adicional

### Dominio Personalizado
Si quieres usar tu propio dominio (ej: elrincondeltapeoii.com):

1. Compra un dominio
2. En GitHub Pages settings, añade tu dominio en "Custom domain"
3. Configura los registros DNS en tu proveedor de dominio

### Analytics
Para añadir Google Analytics:
1. Crea una cuenta en [Google Analytics](https://analytics.google.com)
2. Añade el código de seguimiento en `index.html` antes de `</head>`

### Formulario de Contacto Real
Para hacer funcional el formulario de reservas:
1. Usa un servicio como [Formspree](https://formspree.io/) o [Netlify Forms](https://www.netlify.com/products/forms/)
2. Actualiza el atributo `action` del formulario

---

**¡Tu sitio web está listo para ser visto por todo el mundo!** 🎉