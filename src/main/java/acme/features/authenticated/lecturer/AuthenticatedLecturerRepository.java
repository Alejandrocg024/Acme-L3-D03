
package acme.features.authenticated.lecturer;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.SystemConfiguration;
import acme.framework.components.accounts.UserAccount;
import acme.framework.repositories.AbstractRepository;
import acme.roles.Lecturer;

@Repository
public interface AuthenticatedLecturerRepository extends AbstractRepository {

	@Query("select l from Lecturer l where l.userAccount.id = :id")
	Lecturer findOneEmployerByUserAccountId(int id);

	@Query("select ua from UserAccount ua where ua.id = :id")
	UserAccount findOneUserAccountById(int id);

	@Query("select sc from SystemConfiguration sc")
	SystemConfiguration findSystemConfiguration();
}
