// ==UserScript==
// @name        comic sans everywhere
// @namespace   pitust namespace
// @grant       none
// @version     1.0
// @author      -
// @description 9/11/2021, 10:01:05 AM
// ==/UserScript==
{
  const t = document.createElement('div');
  t.innerHTML = '<style>* { font-family: "Comic Sans MS", "Comic Sans" !important; }</style>';
  document.body.appendChild(t);
}
