quine = """s = 'print("s = " + repr(s) + "; eval(s)")'; eval(s)
"""

#https://towardsdatascience.com/how-to-write-your-first-quine-program-947f2b7e4a6f
def quine_test():
    """
    >>> quine_test()
    QUINE!
    """
    import contextlib, io

    f = io.StringIO()
    with contextlib.redirect_stdout(f):
        exec(quine)
    quine_output = f.getvalue()
    if quine == quine_output:
        print("QUINE!")
        return
    print("Not a quine :(")
    print("Code was:   %r" % quine)
    print("Output was: %r" % quine_output)
    print("Side by side:")
    print(quine)
    print("*" * 100)
    print(quine_output)
    print("*" * 100)