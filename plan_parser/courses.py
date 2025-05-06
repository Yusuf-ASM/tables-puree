import openpyxl
import json

wb = openpyxl.load_workbook("./plan.xlsx")
for sheet in wb.worksheets:
    courses = {}
    print(sheet.title)
    # with open(f"./{sheet.title}") as file:
    for course, prerequisite in zip(sheet["B"], sheet["E"]):
        course = course.value
        prerequisite = prerequisite.value
        if (course is None or course == "Course ID"):
            continue
        
        course = course.strip().lower()
        course = "".join(course.split(" ")[:2])
        prerequisite = prerequisite.strip().lower()
        prerequisite = "".join(prerequisite.split(" ")[:2])

        if course not in courses:
            courses[course] = [[], []]

        if prerequisite != "none":
            courses[course][0].append(prerequisite)
            if prerequisite not in courses:
                courses[prerequisite] = [[], []]
            courses[prerequisite][1].append(course)

    for course, prerequisite in zip(sheet["H"], sheet["K"]):
        course = course.value
        prerequisite = prerequisite.value
        if (course is None or course == "Course ID" or course.count("X")!=0):
            continue
        
        course = course.strip().lower()
        course = "".join(course.split(" ")[:2])
        prerequisite = prerequisite.strip().lower()
        prerequisite = "".join(prerequisite.split(" ")[:2])

        if course not in courses:
            courses[course] = [[], []]

        if prerequisite != "none":
            courses[course][0].append(prerequisite)
            if prerequisite not in courses:
                courses[prerequisite] = [[], []]
            courses[prerequisite][1].append(course)

    with open(f"./{sheet.title}.json", "w") as output:
        output.writelines(json.dumps(courses))
