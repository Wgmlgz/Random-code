import os

exclude = ["GoogleMobileAds", "GooglePlayGames", "Editor Default Resources", "Firebase", "Plugins", "TextMesh Pro"]

lines = 0
images = 0
def go(cur):
    if (any(substring in cur for substring in exclude)):
        return
    for dr in os.listdir(cur):
        abs_path = os.path.join(cur, dr)
        if os.path.isdir(abs_path):
            go(abs_path)
        elif 'cs' in dr[-2:]:
            cur_lines = sum(1 for line in open(abs_path))
            global lines
            lines += cur_lines
            print (str(cur_lines) + " " + abs_path)

def goImg(cur):
    if (any(substring in cur for substring in exclude)):
        return
    for dr in os.listdir(cur):
        abs_path = os.path.join(cur, dr)
        if os.path.isdir(abs_path):
            goImg(abs_path)
        elif 'jpg' in dr[-3:] or 'png' in dr[-3:]:
            global images
            images += 1
            print (abs_path)

go(r'C:\U\The-Wayfarer-frog\Assets')
print (lines)
print ()

goImg(r'C:\U\The-Wayfarer-frog\Assets')
print (images)
