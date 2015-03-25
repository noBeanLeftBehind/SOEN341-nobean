﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOEN341_nobean.Class
{
    public class Course
    {
        protected String courseName;
        protected int credits;
        protected String code;
        protected String description; 
        protected List<Course> preRequisites = new List<Course>();
        protected List <Section> sections = new List<Section>();
        Record studentRecord = new Record();

        public Course(String name, String code, String description, int credits)
        {
            this.courseName = name;
            this.code = code;
            this.description = description;
            this.credits = credits;
        }

        protected void addpreRequisites(Course pre)
        {
            preRequisites.Add(pre);
        }

        protected void addSections(Section sec)
        {
            sections.Add(sec);
        }

        public String getCourseName()
        {
            return courseName;
        }

        public void setCourseName(String name)
        {
            this.courseName = name;
        }

        public int getCredits()
        {
            return credits;
        }

        public void setCredits(int credits)
        {
            this.credits = credits;
        }

        public String getCode()
        {
            return code;
        }

        public void setCode(String code)
        {
            this.code = code;
        }

        public String getDescription()
        {
            return description;
        }

        public void setDescription(String descp)
        {
            this.description = descp;
        }

        public Boolean equals(Course cours)
        {
            return (this.courseName == cours.courseName && this.code == cours.code && this.description == cours.description && this.credits == cours.credits);
        }

        public Boolean preReqs()
        {
            foreach (Course i in preRequisites)
            {
                foreach (Course j in studentRecord.coursesTaken)
                {
                    if (j == i)
                        continue;
                    else
                        return false;
                }
            }
            return true;
        }

    }
}