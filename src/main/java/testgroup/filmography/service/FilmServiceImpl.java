package testgroup.filmography.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import testgroup.filmography.dao.FilmDAO;
import testgroup.filmography.dao.FilmDAOImpl;
import testgroup.filmography.model.Film;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class FilmServiceImpl implements FilmService {

    private FilmDAO filmDAO;

    @Autowired
    public void setFilmDAO(FilmDAO filmDAO) {
        this.filmDAO = filmDAO;
    }

    @Transactional
    public List<Film> allFilms(int page) {
        return filmDAO.allFilms(page);
    }

    @Transactional
    public void add(Film film) {
        filmDAO.add(film);
    }

    @Transactional
    public void delete(Film film) {
        filmDAO.delete(film);
    }

    @Transactional
    public void edit(Film film) {
        filmDAO.edit(film);
    }

    @Transactional
    public Film getById(int id) {
        return filmDAO.getById(id);
    }

    @Override
    @Transactional
    public int filmsCount() {
        return filmDAO.filmsCount();
    }


}
