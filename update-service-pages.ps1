# Update service pages with popup functionality

$files = @(
    "ceiling-fan-installation-adelaide.html",
    "emergency-electrician-adelaide.html",
    "ev-charger-installation-adelaide.html",
    "smoke-alarm-installation-adelaide.html",
    "switchboard-upgrade-adelaide.html",
    "switchboard-upgrade-guide-adelaide.html",
    "electrical-safety-inspection-report.html",
    "landlord-electrical-safety-checklist-adelaide.html",
    "adelaide-electrical-pricing-guide.html"
)

$popupCSS = @"
    /* ========== QUOTE POPUP ========== */
    .quotePopup {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.85);
      z-index: 10000;
      display: none;
      align-items: center;
      justify-content: center;
      padding: 20px;
      backdrop-filter: blur(8px);
    }
    .quotePopup.show {
      display: flex;
      animation: fadeIn 0.3s ease;
    }
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    .quotePopupInner {
      background: var(--bg);
      border-radius: var(--radius);
      padding: 40px;
      max-width: 520px;
      width: 100%;
      position: relative;
      box-shadow: var(--shadow);
      border: 1px solid var(--border);
      animation: slideUp 0.4s ease;
    }
    @keyframes slideUp {
      from { transform: translateY(30px); opacity: 0; }
      to { transform: translateY(0); opacity: 1; }
    }
    .quotePopupClose {
      position: absolute;
      top: 16px;
      right: 16px;
      background: rgba(255, 176, 0, 0.1);
      border: 1px solid var(--border);
      color: var(--text);
      width: 36px;
      height: 36px;
      border-radius: 50%;
      font-size: 20px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.2s;
    }
    .quotePopupClose:hover {
      background: var(--accent);
      color: #000;
      transform: rotate(90deg);
    }
    .quotePopupInner h3 {
      font-size: 28px;
      margin-bottom: 12px;
      color: var(--accent);
      font-weight: 800;
    }
    .quotePopupInner p {
      color: var(--muted);
      margin-bottom: 24px;
      font-size: 15px;
    }
    .quoteForm {
      display: flex;
      flex-direction: column;
      gap: 16px;
    }
    .quoteForm input,
    .quoteForm textarea,
    .quoteForm select {
      padding: 14px 18px;
      background: rgba(255, 176, 0, 0.05);
      border: 1px solid var(--border);
      border-radius: 12px;
      color: var(--text);
      font-size: 15px;
      font-family: inherit;
      transition: all 0.2s;
    }
    .quoteForm input:focus,
    .quoteForm textarea:focus,
    .quoteForm select:focus {
      outline: none;
      border-color: var(--accent);
      background: rgba(255, 176, 0, 0.08);
    }
    .quoteForm textarea {
      min-height: 100px;
      resize: vertical;
    }
    .quoteForm button {
      padding: 16px 32px;
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      color: #000;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 700;
      cursor: pointer;
      transition: all 0.2s;
      margin-top: 8px;
    }
    .quoteForm button:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(255, 176, 0, 0.4);
    }
    .quoteSuccessMessage {
      display: none;
      text-align: center;
      padding: 20px;
    }
    .quoteSuccessMessage.show {
      display: block;
    }
    .quoteSuccessMessage h4 {
      color: #00cc70;
      font-size: 24px;
      margin-bottom: 12px;
    }
    .quoteSuccessMessage p {
      color: var(--muted);
      font-size: 16px;
    }
"@

$popupHTML = @"

  <!-- Quote Request Popup -->
  <div class="quotePopup" id="quotePopup">
    <div class="quotePopupInner">
      <button class="quotePopupClose" onclick="closeQuotePopup()" aria-label="Close">×</button>
      
      <div id="quoteFormContainer">
        <h3>Get Your Free Quote</h3>
        <p>Response within 2 hours • No obligation</p>
        
        <form class="quoteForm" id="quoteForm" onsubmit="submitQuoteForm(event)">
          <input type="text" name="name" placeholder="Your Name *" required />
          <input type="tel" name="phone" placeholder="Phone Number *" required pattern="[0-9\s\+\-\(\)]+" />
          <input type="email" name="email" placeholder="Email Address *" required />
          <select name="suburb" required>
            <option value="">Select Suburb *</option>
            <option value="Prospect">Prospect</option>
            <option value="Norwood">Norwood</option>
            <option value="Unley">Unley</option>
            <option value="St Peters">St Peters</option>
            <option value="Burnside">Burnside</option>
            <option value="Vale Park">Vale Park</option>
            <option value="Glenelg">Glenelg</option>
            <option value="North Adelaide">North Adelaide</option>
            <option value="Adelaide CBD">Adelaide CBD</option>
            <option value="Other">Other Adelaide Suburb</option>
          </select>
          <textarea name="description" placeholder="Brief description of work needed *" required></textarea>
          <select name="contact_time">
            <option value="">Preferred Contact Time (Optional)</option>
            <option value="Morning (7am-12pm)">Morning (7am-12pm)</option>
            <option value="Afternoon (12pm-5pm)">Afternoon (12pm-5pm)</option>
            <option value="Evening (5pm-7pm)">Evening (5pm-7pm)</option>
            <option value="Anytime">Anytime</option>
          </select>
          <button type="submit">Send Quote Request</button>
        </form>
      </div>
      
      <div class="quoteSuccessMessage" id="quoteSuccessMessage">
        <h4>✅ Request Received!</h4>
        <p>Thanks! I'll call you within 2 hours (usually much faster).</p>
        <p style="margin-top:16px;"><strong>— Marcus, Amped Up Electrical</strong></p>
      </div>
    </div>
  </div>

  <script>
    // Quote popup logic
    let popupShown = false;

    function showQuotePopup() {
      if (popupShown) return;
      document.getElementById('quotePopup').classList.add('show');
      popupShown = true;
      document.body.style.overflow = 'hidden';
    }

    function closeQuotePopup() {
      document.getElementById('quotePopup').classList.remove('show');
      document.body.style.overflow = 'auto';
    }

    function openQuotePopup() {
      showQuotePopup();
    }

    document.getElementById('quotePopup').addEventListener('click', (e) => {
      if (e.target.id === 'quotePopup') closeQuotePopup();
    });

    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') closeQuotePopup();
    });

    async function submitQuoteForm(e) {
      e.preventDefault();
      const form = e.target;
      const formData = new FormData(form);
      const data = Object.fromEntries(formData);
      
      document.getElementById('quoteFormContainer').style.display = 'none';
      document.getElementById('quoteSuccessMessage').classList.add('show');
      
      console.log('Quote request:', data);
      
      setTimeout(() => {
        closeQuotePopup();
        setTimeout(() => {
          document.getElementById('quoteFormContainer').style.display = 'block';
          document.getElementById('quoteSuccessMessage').classList.remove('show');
          form.reset();
        }, 500);
      }, 4000);
    }
  </script>
"@

foreach ($filename in $files) {
    if (Test-Path $filename) {
        Write-Host "Updating $filename..."
        $content = Get-Content $filename -Raw
        
        # Add popup CSS before </style>
        if ($content -notmatch "quotePopup") {
            $content = $content -replace "</style>", "$popupCSS`n  </style>"
        }
        
        # Add popup HTML and script before </body>
        if ($content -notmatch "quotePopup") {
            $content = $content -replace "</body>", "$popupHTML`n</body>"
        }
        
        # Update buttons that link to #quote
        $content = $content -replace '<a href="#quote" class="btn">', '<a href="#" class="btn" onclick="openQuotePopup(); return false;">'
        $content = $content -replace '<a href="#quote" class="btn ', '<a href="#" class="btn onclick="openQuotePopup(); return false;" '
        
        Set-Content -Path $filename -Value $content -NoNewline
    }
}

Write-Host "Done!"
