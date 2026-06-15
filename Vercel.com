<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Hunting Punch Digital Agency | Punching Through the Competition</title>
  <meta name="description" content="Hunting Punch Digital Agency — Smart Strategies, Targeted Campaigns, Maximum Results. SEO, Google Ads, SMM, Performance Marketing & more." />
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;600;700;800;900&family=Inter:wght@400;500;600&display=swap" rel="stylesheet" />
  <style>
    :root {
      --orange: #FF6B00;
      --black: #111111;
      --white: #FFFFFF;
    }
    * { scroll-behavior: smooth; }
    body { font-family: 'Inter', sans-serif; background: #111111; color: #fff; }
    .font-display { font-family: 'Barlow Condensed', sans-serif; }

    /* NAV */
    #navbar { transition: background 0.3s, box-shadow 0.3s; }
    #navbar.scrolled { background: rgba(17,17,17,0.97); box-shadow: 0 2px 30px rgba(255,107,0,0.15); }
    .nav-link { position: relative; }
    .nav-link::after { content:''; position:absolute; bottom:-3px; left:0; width:0; height:2px; background:#FF6B00; transition:width 0.25s; }
    .nav-link:hover::after, .nav-link.active::after { width:100%; }

    /* HERO */
    .hero-bg {
      background: linear-gradient(135deg, #0a0a0a 0%, #1a0a00 50%, #0a0a0a 100%);
      position: relative; overflow: hidden;
    }
    .hero-bg::before {
      content:''; position:absolute; inset:0;
      background: radial-gradient(ellipse at 70% 50%, rgba(255,107,0,0.12) 0%, transparent 65%);
      pointer-events:none;
    }
    .hero-grid {
      background-image: linear-gradient(rgba(255,107,0,0.04) 1px, transparent 1px),
                        linear-gradient(90deg, rgba(255,107,0,0.04) 1px, transparent 1px);
      background-size: 50px 50px;
    }

    /* LOGO SVG */
    .logo-svg { display:inline-flex; align-items:center; gap:10px; }

    /* GLASS CARDS */
    .glass {
      background: rgba(255,255,255,0.04);
      border: 1px solid rgba(255,107,0,0.15);
      backdrop-filter: blur(12px);
      transition: transform 0.3s, border-color 0.3s, box-shadow 0.3s;
    }
    .glass:hover {
      transform: translateY(-6px);
      border-color: rgba(255,107,0,0.5);
      box-shadow: 0 20px 60px rgba(255,107,0,0.12);
    }

    /* TARGET BOARD */
    .target-ring { animation: pulse-ring 3s ease-in-out infinite; }
    @keyframes pulse-ring { 0%,100%{opacity:0.6} 50%{opacity:1} }
    .arrow-anim { animation: arrow-hit 2s ease-out forwards; transform-origin: right center; }
    @keyframes arrow-hit { 0%{transform:translateX(120px) rotate(-10deg); opacity:0} 70%{transform:translateX(-10px) rotate(-10deg); opacity:1} 100%{transform:translateX(0) rotate(-10deg); opacity:1} }
    .float-card { animation: float 4s ease-in-out infinite; }
    .float-card:nth-child(2) { animation-delay: 1.5s; }
    .float-card:nth-child(3) { animation-delay: 0.8s; }
    @keyframes float { 0%,100%{transform:translateY(0)} 50%{transform:translateY(-10px)} }

    /* COUNTER */
    .counter-val { font-family:'Barlow Condensed',sans-serif; }

    /* SERVICES */
    .service-icon { transition: transform 0.3s; }
    .glass:hover .service-icon { transform: scale(1.15) rotate(-5deg); }

    /* PORTFOLIO CARD */
    .portfolio-card { position:relative; overflow:hidden; }
    .portfolio-card .overlay {
      position:absolute; inset:0; background:rgba(255,107,0,0.92);
      opacity:0; transition:opacity 0.35s; display:flex; flex-direction:column;
      align-items:center; justify-content:center; padding:1.5rem;
    }
    .portfolio-card:hover .overlay { opacity:1; }

    /* TESTIMONIAL SLIDER */
    .testimonial-track { display:flex; transition:transform 0.5s ease; }

    /* CTA BANNER */
    .cta-banner { background: linear-gradient(135deg, #FF6B00, #cc5200); }

    /* SCROLL REVEAL */
    .reveal { opacity:0; transform:translateY(30px); transition:opacity 0.6s, transform 0.6s; }
    .reveal.visible { opacity:1; transform:none; }

    /* MOBILE MENU */
    #mobile-menu { transition:max-height 0.35s, opacity 0.35s; max-height:0; opacity:0; overflow:hidden; }
    #mobile-menu.open { max-height:500px; opacity:1; }

    /* CONTACT FORM */
    input, textarea, select {
      background: rgba(255,255,255,0.05);
      border: 1px solid rgba(255,107,0,0.2);
      color:#fff; border-radius:8px; padding:12px 16px; width:100%;
      outline:none; transition:border-color 0.25s;
    }
    input:focus, textarea:focus { border-color:#FF6B00; }
    input::placeholder, textarea::placeholder { color:rgba(255,255,255,0.4); }

    .btn-primary {
      background: #FF6B00; color:#fff; font-weight:700; border-radius:8px;
      padding:14px 32px; transition:background 0.2s, transform 0.2s, box-shadow 0.2s;
      display:inline-block; font-family:'Barlow Condensed',sans-serif; font-size:1.1rem; letter-spacing:0.05em;
    }
    .btn-primary:hover { background:#e05d00; transform:translateY(-2px); box-shadow:0 10px 30px rgba(255,107,0,0.4); }
    .btn-outline {
      border:2px solid #FF6B00; color:#FF6B00; font-weight:700; border-radius:8px;
      padding:12px 30px; transition:all 0.2s; display:inline-block;
      font-family:'Barlow Condensed',sans-serif; font-size:1.1rem; letter-spacing:0.05em;
    }
    .btn-outline:hover { background:#FF6B00; color:#fff; transform:translateY(-2px); }

    ::-webkit-scrollbar { width:6px; }
    ::-webkit-scrollbar-track { background:#111; }
    ::-webkit-scrollbar-thumb { background:#FF6B00; border-radius:3px; }

    @media (prefers-reduced-motion: reduce) { *, *::before, *::after { animation:none!important; transition:none!important; } }
  </style>
</head>
<body class="antialiased">

<!-- ═══════════ NAVBAR ═══════════ -->
<nav id="navbar" class="fixed top-0 left-0 right-0 z-50 py-4 px-6 lg:px-12">
  <div class="max-w-7xl mx-auto flex items-center justify-between">
    <!-- Logo -->
    <a href="#home" class="logo-svg flex-shrink-0">
      <svg width="48" height="48" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <circle cx="50" cy="50" r="48" fill="white" stroke="#FF6B00" stroke-width="3"/>
        <text x="18" y="58" font-family="'Barlow Condensed',sans-serif" font-weight="900" font-size="44" fill="#111">H</text>
        <text x="52" y="58" font-family="'Barlow Condensed',sans-serif" font-weight="900" font-size="44" fill="#FF6B00">P</text>
        <line x1="14" y1="62" x2="86" y2="38" stroke="#FF6B00" stroke-width="3.5" stroke-linecap="round"/>
        <!-- mini fist -->
        <ellipse cx="49" cy="43" rx="10" ry="8" fill="#111" opacity="0.85"/>
        <rect x="40" y="41" width="18" height="7" rx="3" fill="#333"/>
        <rect x="41" y="46" width="16" height="4" rx="2" fill="#555"/>
      </svg>
      <span class="font-display font-black text-xl leading-tight">
        <span class="text-white">HUNTING</span><br/>
        <span class="text-orange-500" style="color:#FF6B00">PUNCH</span>
      </span>
    </a>

    <!-- Desktop Nav -->
    <ul class="hidden lg:flex items-center gap-8 text-sm font-medium tracking-wide">
      <li><a href="#home" class="nav-link text-white/80 hover:text-white active">Home</a></li>
      <li><a href="#services" class="nav-link text-white/80 hover:text-white">Services</a></li>
      <li><a href="#portfolio" class="nav-link text-white/80 hover:text-white">Portfolio</a></li>
      <li><a href="#about" class="nav-link text-white/80 hover:text-white">About</a></li>
      <li><a href="#testimonials" class="nav-link text-white/80 hover:text-white">Blog</a></li>
      <li><a href="#contact" class="nav-link text-white/80 hover:text-white">Contact</a></li>
    </ul>

    <a href="#contact" class="hidden lg:inline-block btn-primary text-sm">Get Free Consultation</a>

    <!-- Hamburger -->
    <button id="hamburger" class="lg:hidden flex flex-col gap-1.5 p-2" aria-label="Menu">
      <span class="block w-6 h-0.5 bg-white transition-all" id="hb1"></span>
      <span class="block w-6 h-0.5 bg-white transition-all" id="hb2"></span>
      <span class="block w-6 h-0.5 bg-white transition-all" id="hb3"></span>
    </button>
  </div>
  <!-- Mobile Menu -->
  <div id="mobile-menu" class="lg:hidden mt-4 px-2 pb-4">
    <ul class="flex flex-col gap-3 text-sm font-medium">
      <li><a href="#home" class="block px-4 py-2 rounded hover:bg-orange-600 transition">Home</a></li>
      <li><a href="#services" class="block px-4 py-2 rounded hover:bg-orange-600 transition">Services</a></li>
      <li><a href="#portfolio" class="block px-4 py-2 rounded hover:bg-orange-600 transition">Portfolio</a></li>
      <li><a href="#about" class="block px-4 py-2 rounded hover:bg-orange-600 transition">About</a></li>
      <li><a href="#testimonials" class="block px-4 py-2 rounded hover:bg-orange-600 transition">Blog</a></li>
      <li><a href="#contact" class="block px-4 py-2 rounded hover:bg-orange-600 transition">Contact</a></li>
    </ul>
  </div>
</nav>

<!-- ═══════════ HERO ═══════════ -->
<section id="home" class="hero-bg hero-grid min-h-screen flex items-center pt-24 pb-16">
  <div class="max-w-7xl mx-auto px-6 lg:px-12 w-full">
    <div class="grid lg:grid-cols-2 gap-12 items-center">
      <!-- Left -->
      <div class="reveal">
        <div class="inline-flex items-center gap-2 bg-orange-600/10 border border-orange-600/30 rounded-full px-4 py-2 text-orange-400 text-sm font-medium mb-6">
          <span class="w-2 h-2 bg-orange-500 rounded-full animate-pulse"></span>
          Performance-Driven Digital Marketing Agency
        </div>
        <h1 class="font-display font-black text-5xl lg:text-7xl leading-none mb-6 uppercase tracking-tight">
          Smart<br/>
          <span style="color:#FF6B00">Strategies.</span><br/>
          Targeted<br/>
          <span class="text-white/90">Campaigns.</span><br/>
          <span class="text-3xl lg:text-5xl text-white/60">Maximum Results.</span>
        </h1>
        <p class="text-white/60 text-lg mb-8 max-w-md">
          Punching Through the Competition, Driving Digital Success — with data-led campaigns that convert browsers into buyers.
        </p>
        <div class="flex flex-wrap gap-4">
          <a href="#contact" class="btn-primary">Get Free Consultation</a>
          <a href="#services" class="btn-outline">View Services</a>
        </div>
        <!-- Mini stats -->
        <div class="flex gap-8 mt-12 border-t border-white/10 pt-8">
          <div>
            <p class="font-display font-black text-3xl" style="color:#FF6B00">200+</p>
            <p class="text-white/50 text-xs">Happy Clients</p>
          </div>
          <div>
            <p class="font-display font-black text-3xl" style="color:#FF6B00">500+</p>
            <p class="text-white/50 text-xs">Campaigns Run</p>
          </div>
          <div>
            <p class="font-display font-black text-3xl" style="color:#FF6B00">95%</p>
            <p class="text-white/50 text-xs">Satisfaction Rate</p>
          </div>
        </div>
      </div>

      <!-- Right — Target Illustration -->
      <div class="relative flex justify-center items-center min-h-[420px] reveal">
        <!-- Target Board -->
        <svg viewBox="0 0 320 320" width="320" height="320" class="relative z-10" xmlns="http://www.w3.org/2000/svg">
          <!-- Rings -->
          <circle cx="160" cy="160" r="155" fill="none" stroke="rgba(255,107,0,0.15)" stroke-width="2" class="target-ring"/>
          <circle cx="160" cy="160" r="130" fill="rgba(255,107,0,0.05)" stroke="rgba(255,107,0,0.25)" stroke-width="2"/>
          <circle cx="160" cy="160" r="105" fill="rgba(255,107,0,0.07)" stroke="rgba(255,107,0,0.35)" stroke-width="2"/>
          <circle cx="160" cy="160" r="80" fill="rgba(255,107,0,0.10)" stroke="rgba(255,107,0,0.5)" stroke-width="2"/>
          <circle cx="160" cy="160" r="55" fill="rgba(255,107,0,0.15)" stroke="#FF6B00" stroke-width="2"/>
          <circle cx="160" cy="160" r="30" fill="rgba(255,107,0,0.35)" stroke="#FF6B00" stroke-width="3"/>
          <circle cx="160" cy="160" r="12" fill="#FF6B00"/>
          <!-- Cross hairs -->
          <line x1="160" y1="0" x2="160" y2="320" stroke="rgba(255,107,0,0.15)" stroke-width="1"/>
          <line x1="0" y1="160" x2="320" y2="160" stroke="rgba(255,107,0,0.15)" stroke-width="1"/>
          <!-- Arrow -->
          <g class="arrow-anim">
            <line x1="90" y1="145" x2="170" y2="160" stroke="#FF6B00" stroke-width="3" stroke-linecap="round"/>
            <polygon points="170,160 154,152 156,168" fill="#FF6B00"/>
            <!-- feathers -->
            <polygon points="90,145 82,135 96,140" fill="#FF6B00" opacity="0.7"/>
            <polygon points="90,145 80,150 94,152" fill="#FF6B00" opacity="0.5"/>
          </g>
        </svg>

        <!-- Floating Cards -->
        <div class="float-card absolute top-4 right-0 glass rounded-xl p-3 text-xs font-medium z-20 min-w-[130px]">
          <div class="flex items-center gap-2 mb-1">
            <span class="text-green-400">📈</span>
            <span class="text-white/70">Organic Traffic</span>
          </div>
          <div class="font-display font-black text-lg" style="color:#FF6B00">+247%</div>
          <div class="text-white/40 text-xs">Last 90 days</div>
        </div>

        <div class="float-card absolute bottom-8 left-0 glass rounded-xl p-3 text-xs z-20 min-w-[140px]">
          <div class="flex items-center gap-2 mb-1">
            <span>🎯</span>
            <span class="text-white/70">Conversion Rate</span>
          </div>
          <div class="font-display font-black text-lg" style="color:#FF6B00">8.4%</div>
          <div class="flex mt-1 gap-0.5">
            <div class="h-1 rounded bg-orange-600" style="width:84%"></div>
            <div class="h-1 rounded bg-white/20" style="width:16%"></div>
          </div>
        </div>

        <div class="float-card absolute top-1/2 -left-4 glass rounded-xl p-3 text-xs z-20 min-w-[120px]" style="transform:translateY(-50%)">
          <div class="flex items-center gap-2 mb-1">
            <span>🔥</span>
            <span class="text-white/70">Ad ROAS</span>
          </div>
          <div class="font-display font-black text-lg" style="color:#FF6B00">4.8×</div>
          <div class="text-green-400 text-xs">↑ vs last month</div>
        </div>

        <!-- Glow -->
        <div class="absolute inset-0 rounded-full pointer-events-none" style="background:radial-gradient(circle, rgba(255,107,0,0.08) 0%, transparent 70%)"></div>
      </div>
    </div>
  </div>
</section>

<!-- ═══════════ SERVICES ═══════════ -->
<section id="services" class="py-24 px-6 lg:px-12" style="background:#0d0d0d">
  <div class="max-w-7xl mx-auto">
    <div class="text-center mb-16 reveal">
      <p class="text-sm font-semibold tracking-widest uppercase mb-3" style="color:#FF6B00">What We Do</p>
      <h2 class="font-display font-black text-5xl lg:text-6xl uppercase">Our <span style="color:#FF6B00">Services</span></h2>
      <p class="text-white/50 mt-4 max-w-xl mx-auto">Every service is engineered around one goal — measurable growth for your business.</p>
    </div>
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">

      <!-- Service Cards -->
      <div class="glass rounded-2xl p-6 reveal">
        <div class="service-icon text-4xl mb-4">🔍</div>
        <h3 class="font-display font-bold text-xl mb-2">SEO Expert</h3>
        <p class="text-white/50 text-sm">Rank higher on Google with technical, on-page, and off-page SEO that drives sustainable organic traffic.</p>
        <div class="mt-4 h-0.5 w-8 rounded" style="background:#FF6B00"></div>
      </div>

      <div class="glass rounded-2xl p-6 reveal">
        <div class="service-icon text-4xl mb-4">📣</div>
        <h3 class="font-display font-bold text-xl mb-2">Google Ads Specialist</h3>
        <p class="text-white/50 text-sm">PPC campaigns that maximize ROI — from Search and Display to Shopping and YouTube ads.</p>
        <div class="mt-4 h-0.5 w-8 rounded" style="background:#FF6B00"></div>
      </div>

      <div class="glass rounded-2xl p-6 reveal">
        <div class="service-icon text-4xl mb-4">📱</div>
        <h3 class="font-display font-bold text-xl mb-2">Social Media Marketing</h3>
        <p class="text-white/50 text-sm">Build a loyal audience and drive engagement across Instagram, Facebook, TikTok and LinkedIn.</p>
        <div class="mt-4 h-0.5 w-8 rounded" style="background:#FF6B00"></div>
      </div>

      <div class="glass rounded-2xl p-6 reveal">
        <div class="service-icon text-4xl mb-4">⚡</div>
        <h3 class="font-display font-bold text-xl mb-2">Performance Marketing</h3>
        <p class="text-white/50 text-sm">You only pay for results. Data-first paid media strategies that scale what works and kill what doesn't.</p>
        <div class="mt-4 h-0.5 w-8 rounded" style="background:#FF6B00"></div>
      </div>

      <div class="glass rounded-2xl p-6 reveal">
        <div class="service-icon text-4xl mb-4">📊</div>
        <h3 class="font-display font-bold text-xl mb-2">Web Analytics & Reporting</h3>
        <p class="text-white/50 text-sm">GA4, Looker Studio, and custom dashboards so you always know where your budget is going.</p>
        <div class="mt-4 h-0.5 w-8 rounded" style="background:#FF6B00"></div>
      </div>

      <div class="glass rounded-2xl p-6 reveal">
        <div class="service-icon text-4xl mb-4">🎯</div>
        <h3 class="font-display font-bold text-xl mb-2">Lead Generation</h3>
        <p class="text-white/50 text-sm">Precision targeting funnels that attract, qualify, and convert your ideal customers at scale.</p>
        <div class="mt-4 h-0.5 w-8 rounded" style="background:#FF6B00"></div>
      </div>

      <div class="glass rounded-2xl p-6 reveal">
        <div class="service-icon text-4xl mb-4">💹</div>
        <h3 class="font-display font-bold text-xl mb-2">ROI-Focused Campaigns</h3>
        <p class="text-white/50 text-sm">Every rupee tracked. Revenue-driven campaign architecture that ties spend directly to business outcomes.</p>
        <div class="mt-4 h-0.5 w-8 rounded" style="background:#FF6B00"></div>
      </div>

      <!-- CTA card -->
      <div class="rounded-2xl p-6 reveal flex flex-col justify-center items-center text-center" style="background:linear-gradient(135deg,#FF6B00,#cc5200)">
        <div class="text-4xl mb-4">🚀</div>
        <h3 class="font-display font-bold text-xl mb-2">Not sure where to start?</h3>
        <p class="text-white/80 text-sm mb-4">Get a free 30-minute strategy call with our experts.</p>
        <a href="#contact" class="btn-outline" style="border-color:white;color:white">Let's Talk</a>
      </div>

    </div>
  </div>
</section>

<!-- ═══════════ WHY CHOOSE US ═══════════ -->
<section id="about" class="py-24 px-6 lg:px-12" style="background:#111">
  <div class="max-w-7xl mx-auto grid lg:grid-cols-2 gap-16 items-center">
    <!-- Left -->
    <div class="reveal">
      <p class="text-sm font-semibold tracking-widest uppercase mb-3" style="color:#FF6B00">Why Hunting Punch?</p>
      <h2 class="font-display font-black text-5xl lg:text-6xl uppercase leading-tight mb-6">
        Built to <span style="color:#FF6B00">Win.</span><br/>Wired for <span style="color:#FF6B00">Results.</span>
      </h2>
      <p class="text-white/50 mb-8">We're not just another agency running ads. We're a performance-obsessed team that treats your budget like our own and your growth as our KPI.</p>
      <ul class="space-y-4">
        <li class="flex items-start gap-4">
          <div class="w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0 text-xl" style="background:rgba(255,107,0,0.15)">📡</div>
          <div>
            <h4 class="font-semibold text-white mb-1">Data-Driven Decisions</h4>
            <p class="text-wh
