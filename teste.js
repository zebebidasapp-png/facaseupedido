// Teste simples do catálogo - versão mínima funcional
const ADMIN_PASSWORD = '0923';
let products = JSON.parse(localStorage.getItem('catalog_products') || '[]');
let cart = JSON.parse(localStorage.getItem('ze_bebidas_cart') || '[]');

document.addEventListener('DOMContentLoaded', () => {
    renderCatalog();
    updateCartCount();
});

function renderCatalog() {
    const grid = document.getElementById('catalog-grid');
    const empty = document.getElementById('catalog-empty');
    if (products.length === 0) { grid.style.display = 'none'; empty.style.display = 'block'; return; }
    grid.style.display = 'grid'; empty.style.display = 'none';
    grid.innerHTML = products.map(product => `
        <div class="product-card">
            ${product.image ? `<img src="${product.image}" alt="${escapeHtml(product.name)}" class="product-image">` : `<div class="product-image-placeholder">Sem imagem</div>`}
            <div class="product-info">
                <div class="product-code">COD: ${escapeHtml(product.code || '---')}</div>
                <h3 class="product-name">${escapeHtml(product.name)}</h3>
                <p class="product-description">${escapeHtml(product.description)}</p>
                <div class="product-footer">
                    <span class="product-price">${formatCurrency(product.price)}</span>
                    <button class="btn-add-cart" onclick="addToCart('${product.id}')">+ Carrinho</button>
                </div>
            </div>
        </div>
    `).join('');
}

function addToCart(productId) {
    const product = products.find(p => p.id === productId);
    if (!product) return;
    const existing = cart.find(item => item.id === productId);
    if (existing) { existing.qty += 1; } else { cart.push({ id: productId, qty: 1 }); }
    saveCart(); updateCartCount();
    showToast(`${product.name} adicionado ao carrinho!`, 'success');
}

function saveCart() { localStorage.setItem('ze_bebidas_cart', JSON.stringify(cart)); }
function updateCartCount() {
    const count = cart.reduce((sum, item) => sum + item.qty, 0);
    const badge = document.getElementById('cart-count');
    if (count > 0) { badge.textContent = count; badge.style.display = 'flex'; } else { badge.style.display = 'none'; }
}

function escapeHtml(text) { const div = document.createElement('div'); div.textContent = text; return div.innerHTML; }
function formatCurrency(value) { return 'R$ ' + value.toFixed(2).replace('.', ',').replace(/\B(?=(\d{3})+(?!\d))/g, '.'); }
function showToast(message, type = 'success') {
    const container = document.getElementById('toast-container');
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.innerHTML = `<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">${type === 'success' ? '<path d="M22 11.08V12a10 10 0 11-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>' : '<circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/>'}</svg>${escapeHtml(message)}`;
    container.appendChild(toast);
    setTimeout(() => toast.remove(), 3000);
}
