# Хомогенизиране

Дефинирайте метод `homogenize(items)`, който приема списък, състоящ се от
различни елементи и ги разделя типово, връщайки списък от хомогенни списъци.

Вътрешния ред на всеки подсписък трябва да запазва реда на срещане на елементите
в подадения списък. Редът на самите подсписъци във върнатия списък не е от значение.

При подаден празен списък, методът връща празен списък.

Примери:

    homogenize [1, :a, 2, :b, 3, :c]    # [[1, 2, 3], [:a, :b, :c]]
    homogenize [:a, "Jimi", "Kurt", :b] # [[:a, :b], ["Jimi", "Kurt"]]