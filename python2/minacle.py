try:
    with open("big", "wb") as f:
        while True:
            f.write("\0")
except:
    pass
