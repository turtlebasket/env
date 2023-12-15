# Copy to ~/.global.sage

from subprocess import run

ht_filename = "/tmp/mathtemp.html"


def wv(expr):
    """
    View an expression as LaTeX -> mathjax+html in a browser tab
    """
    with open(ht_filename, "w") as f:
        f.write(f"""
                <!DOCTYPE html>
                <html>
                    <meta charset="UTF-8" />
                    <head><title>vis</title></head>
                    <body>
                    <div style="font-size:140%;margin-top:30px;">
                    $${latex(expr)}$$
                    </div>
                    </body>
                    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
                    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
                </html>
                """)
    run(["open", ht_filename])

