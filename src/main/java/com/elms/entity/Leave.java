package com.elms.entity;

import java.util.Comparator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity 
@Table(name = "leave_application") 
public class Leave implements Comparable<Leave>{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String leaveType;

    private String startDate;

    private String endDate;

    private String leaveReason;

  
    private String status = "Pending";  // default value
 // assuming employee data relation
    private String currentDate;
    
    @ManyToOne
    private EmployeeData employee;

    public EmployeeData getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeData employee) {
		this.employee = employee;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
        return id;
    }

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getLeaveReason() {
        return leaveReason;
    }

    public void setLeaveReason(String leaveReason) {
        this.leaveReason = leaveReason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

	public String getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}

	public Leave() {
		super();
	}

	@Override
	public int compareTo(Leave o) {
	   
	    return this.currentDate.compareTo(o.currentDate); // ascending order
	}
    

}
