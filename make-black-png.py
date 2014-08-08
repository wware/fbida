from PIL import Image
size = (1024, 768)
im = Image.new("RGB", size, "black")
im.save("black.png", "PNG")
