---
id: '978'
title: Shadow DOM and shadow root
languages:
- javascript
tags:
---
https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM

> Shadow DOM is very important for web components because it allows specific sections of the HTML document to be completely isolated from the rest of the document. This means CSS styles that are applied to the DOM are not applied to the Shadow DOM, and vice versa. 


The shadow DOM can only be accessed through the reference returned by attachShadow:

```javascript
const shadowComponent =  document.getElementById('component').attachShadow({mode: 'open'}); 
const p = document.createElement('p'); 
p.setAttribute('class', 'title'); 
p.innerText = 'Lorem ipsum'; 
shadowComponent.appendChild(p);
```

The shadow root can be styled with CSS:

```javascript
const css = document.createElement('style'); 
css.innerText = ` 
  .title { 
      font-size: 2rem; 
      font-weight: bolder; 
  }
`; 
shadowComponent.appendChild(css);
```

Use templates and slots make it easier to create components:
https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots

Reference:
https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM

Also see the Awesome Styled Components repository and the Styled Components project for inspiration:
https://github.com/styled-components/awesome-styled-components
https://styled-components.com/
