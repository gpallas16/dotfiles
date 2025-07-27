(() => {
  "use strict";

  // CSS Injector for VS Code (Updated for cached UI)
  // Copy and paste this entire script into VS Code's Developer Console

  const CSSInjector = {
    styleID: "Custom-CSS-Injector",

    // CSS content for different themes
    lightThemeCSS: `
/* === Sidebar and General Styling === */
.monaco-list-row.selected,
.monaco-list-row.focused {
  box-shadow: inset 0 1px 0 #f2f2f209 !important;
  outline: 1px solid #f2f2f220 !important;
}

.monaco-workbench .monaco-list:not(.element-focused):focus:before {
  display: none;
}

.line-numbers {
  width: 36px !important;
}

.current-line-margin-both {
  background-color: #f2f2f212 !important;
  width: calc(100% - 16px) !important;
  left: 12px !important;
  border-radius: 4px;
}

.hover-widget {
  backdrop-filter: blur(10px);
}

.monaco-button {
  border-radius: 4px;
  box-shadow: inset 0 1px 0 #f2f2f209 !important;
}

.notification-toast {
  backdrop-filter: blur(10px);
  border: 1px solid #f2f2f209 !important;
  border-radius: 8px !important;
}

.sidebar ul[role=tablist] .action-item {
  width: 32px;
  padding: 0px !important;
  height: 32px !important;
  display: flex !important;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
}

.sidebar ul[role=tablist] .action-item.checked {
  background-color: #f2f2f212 !important;
  box-shadow: inset 0 1px 0 #f2f2f209 !important;
  border-radius: 6px;
  outline: 1px solid #f2f2f220 !important;
}

.sidebar ul[role=tablist] .action-label:before {
  left: auto !important;
}

.sidebar ul[role=tablist] .active-item-indicator {
  display: none !important;
}

.find-widget {
  border-radius: 6px;
  backdrop-filter: blur(4px);
}

.monaco-inputbox,
.scm-editor {
  border-radius: 6px !important;
}

.slider {
  border-radius: 4px;
  backdrop-filter: blur(10px);
}

.monaco-button-dropdown {
  border-radius: 6px !important;
}

.context-view.monaco-menu-container {
  border: 1px solid #f2f2f209 !important;
  border-radius: 8px !important;
}

.suggest-widget {
  border-radius: 6px !important;
  backdrop-filter: blur(10px);
  overflow: hidden;
  box-shadow: 0 0 10px #f2f2f230;
}

.suggest-widget .monaco-row {
  border-radius: 0px !important;
}

.monaco-hover {
  backdrop-filter: blur(10px);
  border-radius: 8px !important;
}

.monaco-workbench .part.sidebar {
  margin-left: 10px !important;
  margin-right: 10px !important;
  border-radius: 0.5rem;
  display: flex;
  flex-direction: column;
}

.monaco-workbench .part.sidebar > .content {
  width: calc(100%) !important;
}

/* === Editor Styling === */
.monaco-workbench .part.editor > .content .editor-group-container > .title .tabs-container > .tab {
  border: none !important;
}

.monaco-workbench .part.editor > .content .editor-group-container > .title .tabs-container > .tab.active {
  border-radius: 0.5rem;
  border: 1px solid rgb(119, 176, 240) !important;
}

.editor-group-container {
  border-radius: 0.5rem;
  overflow: hidden;
}

.tabs-and-actions-container {
  border-radius: 0.5rem 0.5rem 0 0;
  background: #ffffff;
  padding: 0.35rem;
}

.editor-group-container .editor-container:has(.extension-editor) {
  border-radius: 0.5rem;
}

.monaco-workbench .part.editor > .content {
  position: relative;
  background: #f2f2f2 !important;
}

.monaco-workbench .part.editor > .content .editor-group-container {
  border-radius: 0.5rem;
  overflow: hidden;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}

.monaco-editor {
  border-radius: 0 0 0.5rem 0.5rem;
  overflow: hidden;
}

.monaco-editor-background {
  border-radius: 0.5rem;
}

.breadcrumbs-below-tabs {
  overflow: hidden;
  background: #ffffff;
}

.monaco-breadcrumbs {
  font-size: 0.7rem;
}

.monaco-editor .sticky-widget {
  box-shadow: none;
  border-color: #2b2d30;
}

.monaco-editor .scroll-decoration {
  box-shadow: none;
}

.monaco-workbench .part.editor > .content .editor-group-container.active > .title .tabs-container > .tab.active {
  box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}

.monaco-split-view2.separator-border.vertical > .monaco-scrollable-element > .split-view-container > .split-view-view:not(:first-child):before,
.monaco-split-view2.separator-border > .monaco-scrollable-element > .split-view-container > .split-view-view:not(:first-child):before {
  background: #2b2d30 !important;
}

.monaco-workbench .part.titlebar > .titlebar-container > .titlebar-center > .window-title > .command-center .action-item.command-center-center {
  border-radius: 0.5rem;
  border: none;
}

/* === Panel & Terminal Styling === */
.part.panel .composite-bar-container .actions-container .action-item:not(.checked) a {
  color: rgb(120, 120, 120) !important;
}

.monaco-workbench .part.panel {
  background: #ffffff !important;
  margin: 10px 0px 0 0px;
  height: calc(100% - 10px) !important;
  border-radius: 0.5rem;
}
/* === Auxiliary Sidebar === */
.monaco-workbench .part.auxiliarybar {
  margin-left: 10px !important;
  margin-right: 10px !important;
  border-radius: 0.5rem;
  display: flex;
  flex-direction: column;
}

.monaco-workbench .part.auxiliarybar > .content {
  width: calc(100%) !important;
}

/* === Chat & Misc === */
.monaco-grid-view {
  background: #f2f2f2;
}

.interactive-session .chat-input-container {
  background-color: #f3f8fe;
}

.interactive-session .chat-input-container .chat-editor-container .monaco-editor {
  width: calc(100%);
}

.interactive-session .chat-input-container .chat-editor-container .monaco-editor .view-lines {
  background: rgb(227, 237, 248);
  padding-left: 8px;
  padding-right: 8px;
}

.part.panel .composite {
  border-top-color: transparent !important;
}

.monaco-sash {
background: #FFFFFF
}
        `,

    darkThemeCSS: `
/* === Sidebar and General Styling === */
.monaco-list-row.selected,
.monaco-list-row.focused {
  box-shadow: inset 0 1px 0 #ffffff09 !important;
  outline: 1px solid #00000020 !important;
}

.monaco-workbench .monaco-list:not(.element-focused):focus:before {
  display: none;
}

.line-numbers {
  width: 36px !important;
}

.current-line-margin-both {
  background-color: #ffffff12 !important;
  width: calc(100% - 16px) !important;
  left: 12px !important;
  border-radius: 4px;
}

.hover-widget {
  backdrop-filter: blur(10px);
}

.monaco-button {
  border-radius: 4px;
  box-shadow: inset 0 1px 0 #ffffff09 !important;
}

.notification-toast {
  backdrop-filter: blur(10px);
  border: 1px solid #ffffff09 !important;
  border-radius: 8px !important;
}

.sidebar ul[role=tablist] .action-item {
  width: 32px;
  padding: 0px !important;
  height: 32px !important;
  display: flex !important;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
}

.sidebar ul[role=tablist] .action-item.checked {
  background-color: #ffffff12 !important;
  box-shadow: inset 0 1px 0 #ffffff09 !important;
  border-radius: 6px;
  outline: 1px solid #00000020 !important;
}

.sidebar ul[role=tablist] .action-label:before {
  left: auto !important;
}

.sidebar ul[role=tablist] .active-item-indicator {
  display: none !important;
}

.find-widget {
  border-radius: 6px;
  backdrop-filter: blur(4px);
}

.monaco-inputbox,
.scm-editor {
  border-radius: 6px !important;
}

.slider {
  border-radius: 4px;
  backdrop-filter: blur(10px);
}

.monaco-button-dropdown {
  border-radius: 6px !important;
}

.context-view.monaco-menu-container {
  border: 1px solid #ffffff09 !important;
  border-radius: 8px !important;
}

.suggest-widget {
  border-radius: 6px !important;
  backdrop-filter: blur(10px);
  overflow: hidden;
  box-shadow: 0 0 10px #00000030;
}

.suggest-widget .monaco-row {
  border-radius: 0px !important;
}

.monaco-hover {
  backdrop-filter: blur(10px);
  border-radius: 8px !important;
}

.monaco-workbench .part.sidebar {
  margin-left: 10px !important;
  margin-right: 10px !important;
  border-radius: 0.5rem;
  display: flex;
  flex-direction: column;
}

.monaco-workbench .part.sidebar > .content {
  width: calc(100% - 10px) !important;
}

/* === Editor Styling === */
.monaco-workbench .part.editor > .content .editor-group-container > .title .tabs-container > .tab {
  border: none !important;
  background: #1819b !important;
}

.monaco-workbench .part.editor > .content .editor-group-container > .title .tabs-container > .tab.active {
  border-radius: 0.5rem;
  border: 1px solid rgb(14, 80, 152) !important;
}

.editor-group-container {
  border-radius: 0.5rem;
  overflow: hidden;
}

.tabs-and-actions-container {
  border-radius: 0.5rem 0.5rem 0 0;
  background: #1819b;
  padding: 0.35rem;
}

.editor-group-container .editor-container:has(.extension-editor) {
  border-radius: 0.5rem;
}

.monaco-workbench .part.editor > .content {
  position: relative;
  background: #000000 !important;
}

.monaco-workbench .part.editor > .content .editor-group-container {
  border-radius: 0.5rem;
  overflow: hidden;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}

.monaco-editor {
  border-radius: 0 0 0.5rem 0.5rem;
  overflow: hidden;
}

.monaco-editor-background {
  border-radius: 0.5rem;
}

.breadcrumbs-below-tabs {
  overflow: hidden;
  background: #1819b;
}

.monaco-breadcrumbs {
  font-size: 0.7rem;
}

.monaco-editor .sticky-widget {
  box-shadow: none;
  border-color: #2b2d30;
}

.monaco-editor .scroll-decoration {
  box-shadow: none;
}

.monaco-workbench .part.editor > .content .editor-group-container.active > .title .tabs-container > .tab.active {
  box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}

.monaco-split-view2.separator-border.vertical > .monaco-scrollable-element > .split-view-container > .split-view-view:not(:first-child):before,
.monaco-split-view2.separator-border > .monaco-scrollable-element > .split-view-container > .split-view-view:not(:first-child):before {
  background: #2b2d30 !important;
}

.monaco-workbench .part.titlebar > .titlebar-container > .titlebar-center > .window-title > .command-center .action-item.command-center-center {
  border-radius: 0.5rem;
  border: none;
}

/* === Panel & Terminal Styling === */
.part.panel .composite-bar-container .actions-container .action-item:not(.checked) a {
  color: rgb(120, 120, 120) !important;
}

.monaco-workbench .part.panel {
  background: #1819b !important;
  margin: 10px 0px 0 0px;
  height: calc(100% - 10px) !important;
  border-radius: 0.5rem;
}
/* === Auxiliary Sidebar === */
.monaco-workbench .part.auxiliarybar {
  margin-left: 10px !important;
  margin-right: 10px !important;
  border-radius: 0.5rem;
  display: flex;
  flex-direction: column;
}

.monaco-workbench .part.auxiliarybar > .content {
  width: calc(100%) !important;
}

/* === Chat & Misc === */
.monaco-grid-view {
  background: #000000;
}

.interactive-session .chat-input-container {
  background-color: #10253d;
}

.interactive-session .chat-input-container .chat-editor-container .monaco-editor {
  width: calc(100%);
}

.interactive-session .chat-input-container .chat-editor-container .monaco-editor .view-lines {
  background: #0d1f33;
  padding-left: 8px;
  padding-right: 8px;
}

.part.panel .composite {
  border-top-color: transparent !important;
}
        `,

    // Function to remove VS Code's inline styles
    removeInlineStyles: function () {
      const targetElements = document.querySelectorAll(
        ".monaco-workbench .part.editor > .content"
      );
      targetElements.forEach((element) => {
        // Remove inline styles that override our CSS
        if (element.style.backgroundColor) {
          element.style.removeProperty("background-color");
        }
        if (element.style.background) {
          element.style.removeProperty("background");
        }
        console.log("Removed inline styles from:", element);
      });
    },

    // Function to force apply styles with maximum priority
    forceApplyStyles: function () {
      // Create a style element with maximum specificity
      const theme = this.detectTheme();
      const forceStyle = document.createElement("style");
      forceStyle.id = "Force-CSS-Override";
      forceStyle.textContent =
        theme === "dark"
          ? `
                /* Force override with maximum specificity */
                html body .monaco-workbench .part.editor > .content {
                    background-color: #000000 !important;
                    background: #000000 !important;
                }
                
                /* Override any inline styles */
                html body .monaco-workbench .part.editor > .content[style] {
                    background-color: #000000 !important;
                    background: #000000 !important;
                }
            `
          : `
                /* Force override with maximum specificity */
                html body .monaco-workbench .part.editor > .content {
                    background-color: #f2f2f2 !important;
                    background: #f2f2f2 !important;
                }
                
                /* Override any inline styles */
                html body .monaco-workbench .part.editor > .content[style] {
                    background-color: #f2f2f2 !important;
                    background: #f2f2f2 !important;
                }
            `;
      document.head.appendChild(forceStyle);
      console.log("Force override styles applied");
    },

    // Function to automatically add !important to all CSS properties
    addImportantToCSS: function (cssContent) {
      // Split CSS into lines
      const lines = cssContent.split("\n");
      const processedLines = [];

      for (let line of lines) {
        // Check if line contains a CSS property (has : and ;)
        if (line.includes(":") && line.includes(";")) {
          // If the property doesn't already have !important, add it
          if (!line.includes("!important")) {
            line = line.replace(/;(\s*)$/, " !important;");
          }
        }
        processedLines.push(line);
      }

      return processedLines.join("\n");
    },

    // Multiple injection methods for cached UI
    injectCSS: function (cssContent) {
      console.log("Attempting CSS injection with multiple methods...");

      // Remove VS Code's inline styles first
      this.removeInlineStyles();

      // Automatically add !important to all CSS properties
      const enhancedCSS = this.addImportantToCSS(cssContent);
      console.log("CSS enhanced with !important declarations");

      // Method 1: Inject into head
      try {
        const styleElement = document.createElement("style");
        styleElement.id = this.styleID;
        styleElement.textContent = enhancedCSS;
        document.head.appendChild(styleElement);
        console.log("Method 1: Injected into document.head");

        // Force apply override styles
        this.forceApplyStyles();
        return true;
      } catch (e) {
        console.log("Method 1 failed:", e.message);
      }

      // Method 2: Inject into body
      try {
        const styleElement = document.createElement("style");
        styleElement.id = this.styleID;
        styleElement.textContent = enhancedCSS;
        document.body.insertAdjacentElement("afterbegin", styleElement);
        console.log("Method 2: Injected into document.body");

        // Force apply override styles
        this.forceApplyStyles();
        return true;
      } catch (e) {
        console.log("Method 2 failed:", e.message);
      }

      // Method 3: Inject into shadow DOM if available
      try {
        const workbenchElement = document.querySelector(
          "#workbench\\.parts\\.workbench"
        );
        if (workbenchElement && workbenchElement.shadowRoot) {
          const styleElement = document.createElement("style");
          styleElement.id = this.styleID;
          styleElement.textContent = enhancedCSS;
          workbenchElement.shadowRoot.appendChild(styleElement);
          console.log("Method 3: Injected into shadow DOM");
          return true;
        }
      } catch (e) {
        console.log("Method 3 failed:", e.message);
      }

      // Method 4: Use CSS injection API if available
      try {
        if (window.monaco && window.monaco.editor) {
          // Try to inject via Monaco editor API
          console.log("Method 4: Attempting Monaco editor injection");
          return true;
        }
      } catch (e) {
        console.log("Method 4 failed:", e.message);
      }

      console.error("All injection methods failed");
      return false;
    },

    updateCustomCSS: function (cssContent) {
      // Remove existing styles first
      this.removeCustomCSS();

      // Try to inject new styles
      const success = this.injectCSS(cssContent);

      if (success) {
        console.log("CSS updated successfully");
        this.verifyInjection();
      } else {
        console.error("Failed to inject CSS");
      }
    },

    removeCustomCSS: function () {
      // Remove from multiple possible locations
      const selectors = [
        `#${this.styleID}`,
        `head #${this.styleID}`,
        `body #${this.styleID}`,
        `#workbench\\.parts\\.workbench #${this.styleID}`,
        "#Force-CSS-Override",
      ];

      selectors.forEach((selector) => {
        const element = document.querySelector(selector);
        if (element) {
          element.remove();
          console.log(`Removed style element: ${selector}`);
        }
      });
    },

    // Verify that injection worked
    verifyInjection: function () {
      setTimeout(() => {
        const styleElement = document.querySelector(`#${this.styleID}`);
        if (styleElement) {
          console.log("✓ CSS injection verified - style element found");
          console.log("Style content length:", styleElement.textContent.length);
        } else {
          console.warn(
            "⚠ CSS injection may have failed - style element not found"
          );
        }
      }, 100);
    },

    // Detect current theme
    detectTheme: function () {
      // Method 1: Check for dark theme classes
      if (
        document.body.classList.contains("vs-dark") ||
        document.body.classList.contains("hc-black") ||
        document.querySelector(".vs-dark") ||
        document.querySelector(".hc-black")
      ) {
        return "dark";
      }

      // Method 2: Check for light theme classes
      if (
        document.body.classList.contains("vs") ||
        document.body.classList.contains("vs-light") ||
        document.querySelector(".vs") ||
        document.querySelector(".vs-light")
      ) {
        return "light";
      }

      // Method 3: Check computed styles
      const editorElement = document.querySelector(".monaco-editor");
      if (editorElement) {
        const backgroundColor = getComputedStyle(editorElement).backgroundColor;
        console.log("Editor background color:", backgroundColor);
        if (
          backgroundColor.includes("rgb(30, 30, 30)") ||
          backgroundColor.includes("rgb(37, 37, 38)") ||
          backgroundColor.includes("rgb(0, 0, 0)")
        ) {
          return "dark";
        }
      }

      return "light";
    },

    // Apply theme-specific CSS
    applyThemeCSS: function () {
      const currentTheme = this.detectTheme();
      console.log(`Detected theme: ${currentTheme}`);

      const cssContent =
        currentTheme === "dark" ? this.darkThemeCSS : this.lightThemeCSS;
      this.updateCustomCSS(cssContent);

      console.log(`CSS applied for ${currentTheme} theme`);
    },

    // Monitor theme changes
    startThemeMonitoring: function () {
      // Monitor class changes on body
      const observer = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
          if (
            mutation.type === "attributes" &&
            mutation.attributeName === "class"
          ) {
            console.log("Body class changed, applying theme CSS");
            this.applyThemeCSS();
          }
        });
      });

      observer.observe(document.body, {
        attributes: true,
        attributeFilter: ["class"],
      });

      // Poll for theme changes (more reliable for cached UI)
      setInterval(() => {
        const currentTheme = this.detectTheme();
        if (this.lastDetectedTheme !== currentTheme) {
          console.log(
            `Theme changed from ${this.lastDetectedTheme} to ${currentTheme}`
          );
          this.lastDetectedTheme = currentTheme;
          this.applyThemeCSS();
        }
      }, 1000);

      console.log("Theme monitoring started");
    },
  };

  // Initialize the CSS injector
  CSSInjector.lastDetectedTheme = null;
  CSSInjector.applyThemeCSS();
  CSSInjector.startThemeMonitoring();

  // Expose functions globally
  window.CSSInjector = {
    applyLightTheme: () =>
      CSSInjector.updateCustomCSS(CSSInjector.lightThemeCSS),
    applyDarkTheme: () => CSSInjector.updateCustomCSS(CSSInjector.darkThemeCSS),
    remove: () => CSSInjector.removeCustomCSS(),
    detectTheme: () => CSSInjector.detectTheme(),
    applyThemeCSS: () => CSSInjector.applyThemeCSS(),
    removeInlineStyles: () => CSSInjector.removeInlineStyles(),
    forceApplyStyles: () => CSSInjector.forceApplyStyles(),
  };

  console.log("CSS Injector for VS Code cached UI: Successfully installed!");
  console.log("Available commands:");
  console.log("- CSSInjector.applyLightTheme()");
  console.log("- CSSInjector.applyDarkTheme()");
  console.log("- CSSInjector.remove()");
  console.log("- CSSInjector.detectTheme()");
  console.log("- CSSInjector.removeInlineStyles()");
  console.log("- CSSInjector.forceApplyStyles()");
})();
