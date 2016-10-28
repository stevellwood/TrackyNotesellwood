package com.ssa.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ssa.entity.Note;

@Transactional
@Repository
public class NoteDAO implements INoteDAO {
	
	@Autowired
    private HibernateTemplate hibernateTemplate;
    
    public NoteDAO(HibernateTemplate ht) {
    	this.hibernateTemplate = ht;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Note> getAllNotes() {
        String hql = "FROM Note as p ORDER BY p.id";
        return (List<Note>) hibernateTemplate.find(hql);
    }

	@Override
	public Note getNoteById(int noteId) {
		return (Note) hibernateTemplate.get(Note.class, noteId);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Note> getNotesByProjectId(int projectId) {
		String hql = "From Note where project_id =" + projectId;
		List<Note> notes = (List<Note>) hibernateTemplate.find(hql);
		return notes;
	}

	@Override
	public boolean addNote(Note note) {
		int result = (int) hibernateTemplate.save(note);
		if (result != -1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void updateNote(Note note) {
		Note update = getNoteById(note.getId());
		update.setTime_stamp(note.getTime_stamp());
		update.setMessage(note.getMessage());
		update.setProject_id(note.getProject_id());
		update.setFlagged(note.getFlagged());
		update.setResolved(note.getResolved());
		hibernateTemplate.update(update);
	}

	@Override
	public void deleteNote(Note note) {
		Note delete = getNoteById(note.getId());
		hibernateTemplate.delete(delete);
	}
}
