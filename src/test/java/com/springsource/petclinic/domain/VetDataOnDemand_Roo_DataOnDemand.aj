// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.springsource.petclinic.domain.Vet;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VetDataOnDemand_Roo_DataOnDemand {
    
    declare @type: VetDataOnDemand: @Component;
    
    private Random VetDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Vet> VetDataOnDemand.data;
    
    public Vet VetDataOnDemand.getNewTransientVet(int index) {
        com.springsource.petclinic.domain.Vet obj = new com.springsource.petclinic.domain.Vet();
        java.lang.String address = "address_" + index;
        if (address.length() > 50) {
            address  = address.substring(0, 50);
        }
        obj.setAddress(address);
        obj.setBirthDay(new java.util.Date());
        java.lang.String city = "city_" + index;
        if (city.length() > 30) {
            city  = city.substring(0, 30);
        }
        obj.setCity(city);
        obj.setEmail("email_" + index);
        obj.setEmployedSince(new java.util.GregorianCalendar(java.util.Calendar.getInstance().get(java.util.Calendar.YEAR), java.util.Calendar.getInstance().get(java.util.Calendar.MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.DAY_OF_MONTH) - 1));
        obj.setFirstName("firstName_" + index);
        obj.setHomePage("homePage_" + index);
        java.lang.String lastName = "lastName_" + index;
        if (lastName.length() > 30) {
            lastName  = lastName.substring(0, 30);
        }
        obj.setLastName(lastName);
        obj.setSpecialty(null);
        obj.setTelephone("telephone_" + index);
        return obj;
    }
    
    public Vet VetDataOnDemand.getSpecificVet(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Vet obj = data.get(index);
        return Vet.findVet(obj.getId());
    }
    
    public Vet VetDataOnDemand.getRandomVet() {
        init();
        Vet obj = data.get(rnd.nextInt(data.size()));
        return Vet.findVet(obj.getId());
    }
    
    public boolean VetDataOnDemand.modifyVet(Vet obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void VetDataOnDemand.init() {
        if (data != null && !data.isEmpty()) {
            return;
        }
        
        data = com.springsource.petclinic.domain.Vet.findVetEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Vet' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.springsource.petclinic.domain.Vet>();
        for (int i = 0; i < 10; i++) {
            com.springsource.petclinic.domain.Vet obj = getNewTransientVet(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}